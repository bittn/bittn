class BittnError < StandardError; end
class BikeError < BittnError; end
if $0 == __FILE__
  print "to debug :[BittnError / BikeError / StandardError]:"
  ans = gets.chomp
  case ans
  when "BittnError","bittnerror","bittn"
    raise BittnError, "BittnError's message"
  when "BikeError","bikeerror","bike"
    raise BikeError, "BikeError's message"
  when "StandardError","standarderror","standard"
    raise StandardError, "StandardError's message"
  else
    puts "BittnError / BikeError / StandardError"
    exit 1
  end
end
