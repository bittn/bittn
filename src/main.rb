require "#{ENV["BITTNDIR"]}/src/optsparse.rb"
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"
require "#{ENV["BITTNDIR"]}/lib/bike/main.rb"
require "#{ENV["BITTNDIR"]}/src/error.rb"

begin
  require 'ripper'
  class Bittn
    def initialize(argv)
      # optparse --------------------------
      opts = OptParse.new(argv)
      @@prgconfig,args,optvol = opts.run
      if @prgconfig[:debug]
        newblock()
        puts "---------------- START DEBUG ------------------------------------"
        newblock()
      end
      if @prgconfig[:debug]
        newval(@prgconfig,"@prgconfig")
        newval(args,"args")
        newval(optvol,"optvol")
      end

      newblock("inputs") if @prgconfig[:debug]
      if args.size < 2
        raise BittnError,"File or Bikefile not specified. (FileError)"
      end
      if args.size > 2
        raise BittnError,"Number of arguments is more than #{optval+1}. (LoadError)"
      end
      bikefile = args[0]
      filename = args[1]
      newval(filename,"filename") if @prgconfig[:debug]
      newval(bikefile,"bikefile") if @prgconfig[:debug]
      if !File.exist?(filename)
        raise BittnError,"File is not found. (FileError)"
      end
      if !File.file?(filename)
        raise BittnError,"Can't assign to keyword. (FileError)"
      end
      if !File.exist?(bikefile)
        raise BittnError,"Bikefile is not found. (FileError)"
      end
      if !File.file?(bikefile)
        raise BittnError,"Can't assign to keyword. (FileError)"
      end
      newblock("parser") if @prgconfig[:debug]
    end
  end
  if $0 == __FILE__ then
  Bittn.new(ARGV)
  end
rescue BittnError => e
  newblock("bittn error") if @prgconfig[:debug]
  puts e.message
  exit(1)
rescue => e
  newblock("standard error") if @prgconfig[:debug]
  if @prgconfig[:debug]
    raise
  else
    puts "--------------------------!error!--------------------------------"
    puts e.message
    puts "Traceback : "
    puts $@
    puts "-----------------------------------------------------------------"
    puts "An error is occurred in the processing system"
    puts "You can issue issues on Github."
    puts "https://github.com/pinenut-programming-language/bittn/issues/new"
    puts "-----------------------------------------------------------------"
  end
  exit(1)
end
