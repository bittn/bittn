begin
  require 'parslet'
  require_relative 'lexer.rb'
  require_relative 'tokensteam.rb'
  require_relative 'parser.rb'

  inputs = ARGV
  p inputs
  p inputs[-1]
  if !inputs[-1]
    puts "File not specified."
    exit(1)
  end
  filename =  inputs[-1]
  if !File.exist?(filename)
    puts "File is not found"
    exit(1)
  end
  if !File.file?(filename)
    puts "Can't assign to keyword"
    exit(1)
  end
  p filename
  lexer = Lexer.new(filename)
  tokensteam = TokenSteam.new(lexer.run)
  token = []
  tokensteam.getToken.size.times do |i|
    token.push(tokensteam.getToken[i-1][0])
  end
  parser = PinenutParser.new.parse(token.join)
  tree = parser.run
  p token
  p tree
rescue
  puts error.message
  puts $!
  puts $@
  puts "An error that occurred in the processing system"
  puts "You can issue issues on Github."
  puts "https://github.com/pinenut-programming-language/bittn/issues/new"
end
