begin
  require 'parslet'
  require_relative 'lexer.rb'
  require_relative 'tokensteam.rb'
  require_relative 'parser.rb'
  isdebug = false
  if ARGV.include?("-d") || ARGV.include?("--debug")
    isdebug = true
  end
  if isdebug
    puts "ARGV Reading"
  end
  inputs = ARGV
  if isdebug
    puts "inputs = #{ARGV}"
  end
  if !inputs[-1]
    puts "File not specified."
    exit(1)
  end
  filename =  inputs[-1]
  if isdebug
    puts "filename = #{inputs[-1]}"
  end
  if !File.exist?(filename)
    puts "File is not found"
    exit(1)
  end
  if !File.file?(filename)
    puts "Can't assign to keyword"
    exit(1)
  end
  if isdebug
    puts "---------------------------start lexer---------------------------"
  end
  lexer = Lexer.new(filename)
  if isdebug
    puts "---------------------------finished lexer------------------------"
  end
  if isdebug
    puts "---------------------------make lexer----------------------------"
  end
  tokensteam = TokenSteam.new(lexer.run)
  token = []
  if isdebug
    puts "---------------------------made lexer----------------------------"
  end
  tokensteam.getToken.size.times do |i|
    token.push(tokensteam.getToken[i-1][0])
  end
  if isdebug
    puts "---------------------------start parser--------------------------"
  end
  parser = PinenutParser.new.parse(token.join)
  tree = parser.rune
  if isdebug
    puts "---------------------------finished parser-----------------------"
    puts "tree = #{tree}"
  end
rescue => error
  # puts error.message
  # puts $!
  if isdebug
    puts "--------------------------!error!--------------------------------"
    raise
    puts "-----------------------------------------------------------------"
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
