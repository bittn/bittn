class BittnError < StandardError; end
begin
  # requires-----------------------------
  require 'parslet'
  require_relative 'debugmsgs.rb'
  require_relative 'lexer.rb'
  require_relative 'tokensteam.rb'
  require_relative 'parser.rb'
  require_relative 'optsparse.rb'
  # optsparse----------------------------
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
    newval(optvol,"optval")
  end

  newblock("inputs") if prgconfig[:debug] # inputs-------------------------------
  if args.size < 1
    raise BittnError,"File not specified. (FileError)"
  end
  if args.size > 1
    raise BittnError,"Number of arguments is more than #{optvol+1}. (LoadError)"
  end
  filename = args[0]
  newval(filename,"filename") if prgconfig[:debug]
  if !File.exist?(filename)
    raise BittnError,"File is not found. (FileError)"
  end
  if !File.file?(filename)
    raise BittnError,"Can't assign to keyword. (FileError)"
  end
  newblock("lexer") if prgconfig[:debug] # lexer-------------------------------
  lexer = Lexer.new(filename,prgconfig)
  finished("make lexer class") if prgconfig[:debug]
  newblock("tokensteam") if prgconfig[:debug]
  tokensteam = TokenSteam.new(lexer.run)
  finished("make tokensteam class") if prgconfig[:debug]
  token = []
  tokensteam.getToken.size.times do |i|
    token.push(tokensteam.getToken[i-1][0])
  end
  finished("make token array by tokensteam") if prgconfig[:debug]
  newval(token,"token") if prgconfig[:debug]
  newblock("parser") if prgconfig[:debug]
  parser = PinenutParser.new.parse(token.join)
  finished("make parser class") if prgconfig[:debug]
  tree = parser.run
  finished("parser run") if prgconfig[:debug]
  newval(tree,"tree") if prgconfig[:debug]
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
    puts error.message
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
