require "byebug"
require "launchy"
require "ripper"

require "#{ENV["BITTNDIR"]}/lib/libloader/main.rb"
libloader().each { |n| require n }

prgconfig, args, optvol = OptParse.new(ARGV).run
newval(prgconfig, "prgconfig") if prgconfig[:debug]
byebug if prgconfig[:byebug]

begin
  class Bittn
    def initialize(prgconfig, args, optvol)
      if prgconfig[:debug]
        newblock()
        puts "---------------- START DEBUG ------------------------------------"
        newblock()
      end
      if prgconfig[:debug]
        newval(prgconfig, "prgconfig")
        newval(args, "args")
        newval(optvol, "optvol")
      end
      newblock("inputs") if prgconfig[:debug]
      if args.size < 1
        raise BittnError, "File and Bikefile not specified. (FileError)"
      end
      if args.size < 2
        raise BittnError, "File or Bikefile not specified. (FileError)"
      end
      if args.size > 2
        raise BittnError, "Number of arguments is more than #{optval + 1}. (LoadError)"
      end
      bikefile = args[0]
      filename = args[1]
      newval(filename, "filename") if prgconfig[:debug]
      newval(bikefile, "bikefile") if prgconfig[:debug]
      if !File.exist?(filename)
        raise BittnError, "Scriptfile is not found. (FileError)"
      end
      if !File.file?(filename)
        raise BittnError, "Can't assign to keyword. (FileError)"
      end
      if !File.exist?(bikefile)
        raise BittnError, "Bikefile is not found. (FileError)"
      end
      if !File.file?(bikefile)
        raise BittnError, "Can't assign to keyword. (FileError)"
      end
      require "#{ENV["PROJECTDIR"]}/" + bikefile
      lang = Lang.new
      newval("", "lang") if prgconfig[:debug]
      newblock("parse") if prgconfig[:debug]
      parser = Marshal.load(lang.getParser)
      code = open(filename, &:read)
      parser_result = parser.parse(code)
      print("RESULT : \n") if prgconfig[:debug]
      pp parser_result if prgconfig[:debug]
      finished("PARSE") if prgconfig[:debug]
      if prgconfig[:parse_only]
        exit(0)
      end
      newblock("TRANSFORM") if prgconfig[:debug]
      transformer = BittnTransformer.new(parser_result, Marshal.dump(lang))
      transformer_result = transformer.transform("")
      print("RESULT : \n") if prgconfig[:debug] || prgconfig[:transform_only]
      pp transformer_result if prgconfig[:debug] || prgconfig[:transform_only]
      finished("TRANSFORM") if prgconfig[:debug] || prgconfig[:transform_only]
      if prgconfig[:transform_only]
        exit(0)
      end
      newblock("run") if prgconfig[:debug]
      runner = BittnRunner.new(Marshal.dump(lang))
      runner_result = runner.run("", transformer_result, "#{ENV["PROJECTDIR"]}/" + bikefile)
      print("RESULT : \n") if prgconfig[:debug]
      pp runner_result if prgconfig[:debug]
    end
  end

  if $0 == __FILE__
    Bittn.new(prgconfig, args, optvol)
  end
rescue BittnError => e
  newblock("bittn error") if prgconfig[:debug]
  puts e.message
  exit(1)
rescue Parslet::ParseFailed => e
  newblock("parslet error") if prgconfig[:debug]
  puts e.message + " (ParseError)"
  exit(1)
rescue => e
  newblock("standard error") if prgconfig[:debug]
  if prgconfig[:debug]
    raise
  else
    puts "--------------------------!error!--------------------------------"
    puts e.message
    puts "Traceback : "
    puts $@
    puts "-----------------------------------------------------------------"
    puts "Giving the -d option may help."
    puts "If that doesn't work, please issue on Github."
    puts "-----------------------------------------------------------------"
    if yesno("Will you issue on github?")
      puts "Thank you for your issue."
      puts ""
      Launchy.open("https://github.com/pinenut-programming-language/bittn/issues/new?labels=&title=bug%20report%20from%20command")
    else
      puts "You can issue on github."
      puts "https://github.com/pinenut-programming-language/bittn/issues/new"
    end
  end
  exit(1)
end

