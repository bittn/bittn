require 'parslet'
class PinenutParser < Parslet::Parser
  rule(:int){
    (match("+") | match("-")).maybe >> match("TOK_NUMBER")
  }

  rule(:monomial){
    int >> (match(" ").repeat >> match("*") | match("/") >> match(" ").repeat >> int).repeat(1)
  }

  rule(:expression){
    monomial >> (match(" ").repeat >> match("+") | match("-") >> monomial).repeat(1)
  }

  rule(:value){
    match("TOK_CHAR") | expression
  }

  rule(:method){
    match("TOK_IDENTIFIERS") >> match('(') >> match(" ").repeat >> value >> match(" ").repeat >> match(')')
  }

  rule(:assign){
    match("TOK_TYPE") >> match(" ").repeat(1) >> match("TOK_CHAR") >> match(" ").repeat >> match("=") >> match(" ").repeat >> value
  }

  rule(:line){
    assign | method
  }
  rule(:code){
    line >> line.maybe
  }

  root(:code)
end
