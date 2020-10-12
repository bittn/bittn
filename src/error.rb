require "#{ENV["BITTNDIR"]}/lib/libloader/main.rb"
libloader().each { |n| require n }

class BittnError < StandardError; end

if $0 == __FILE__
  print "to debug :[BittnError / BikeError / StandardError]:"
  ans = gets.chomp
  case ans
  when "BittnError", "bittnerror", "bittn"
    raise BittnError, "BittnError's message"
  when "StandardError", "standarderror", "standard"
    raise StandardError, "StandardError's message"
  else
    puts "BittnError / BikeError / StandardError"
    exit 1
  end
end
