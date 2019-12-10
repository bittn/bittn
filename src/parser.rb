require 'parslet'
class NumericParser < Parslet::Parser
  root(:number)
  rule(:number) {
  }
end
p NumericParser.new.parse('1')
