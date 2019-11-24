class BittnError < StandardError; end
begin
  require 'ripper'
  require_relative 'parser.rb'
  require_relative 'optsparse.rb'
  require_relative 'debugmsgs.rb'
  # optparse --------------------------
  opts = OptParse.new(ARGV)
  prgconfig,args,optvol = opts.run
  if prgconfig[:debug]
    newblock()
    puts "---------------- START DEBUG ------------------------------------"
    newblock()
  end
  if prgconfig[:debug]
    newval(prgconfig,"prgconfig")
    newval(args,"args")
    newval(optvol,"optvol")
  end

  newblock("inputs") if prgconfig[:debug]
  if args.size < 1
    raise BittnError,"File not specified. (FileError)"
  end
  if args.size > 1
    raise BittnError,"Number of arguments is more than #{optval+1}. (LoadError)"
  end
  filename = args[0]
  newval(filename,"filename") if prgconfig[:debug]
  if !File.exist?(filename)
    raise BittnError,"File is not found. (FileError)"
  end
  if !File.file?(filename)
    raise BittnError,"Can't assign to keyword. (FileError)"
  end
  newblock("parser") if prgconfig[:debug]
  parser = Parser.new(filename,prgconfig)
  ast = parser.run
  msg("Maked AST") if prgconfig[:debug]
  pp ast if prgconfig[:debug]
rescue BittnError => e
  newblock("bittn error") if prgconfig[:debug]
  puts e.message
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
    puts "An error that occurred in the processing system"
    puts "You can issue issues on Github."
    puts "https://github.com/pinenut-programming-language/bittn/issues/new"
    puts "-----------------------------------------------------------------"
  end
  exit(1)
end
