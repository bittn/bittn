require 'parslet'
class NumericParser < Parslet::Parser
  idens = ["print"]
  root(:code)
  rule(:space){ str(" ") }
  rule(:spaces){ space.repeat(1) }
  rule(:space?){ spaces.maybe }
  rule(:return_mark){ str("\n") }
  rule(:returns){ return_mark.repeat(1) }
  rule(:return?){ returns.maybe }
  rule(:sprt?){ (return_mark | space).repeat(0)}
  rule(:chars){ str("a") | str("b") | str("c") | str("d") | str("e") | str("f") | str("g") | str("h") | str("i") | str("j") | str("k") | str("l") | str("m") | str("n") | str("o") | str("p") | str("q") | str("r") | str("s") | str("t") | str("u") | str("v") | str("w") | str("x") | str("y") | str("z") | str("A") | str("B") | str("C") | str("D") | str("E") | str("F") | str("G") | str("H") | str("I") | str("J") | str("K") | str("L") | str("M") | str("N") | str("O") | str("P") | str("Q") | str("R") | str("S") | str("T") | str("U") | str("V") | str("W") | str("X") | str("Y") | str("Z") | str("0") | str("1") | str("2") | str("3") | str("4") | str("5") | str("6") | str("7") | str("8") | str("9") | str(" ") | str("!") | str("\\\"") | str("#") | str("$") | str("%") | str("&") | str("\\'") | str("(") | str(")") | str("-") | str("^") | str("@") | str("[") | str(";") | str(":") | str("]") | str(",") | str(".") | str("/") | str("\\\\") | str("=") | str("~") | str("|") | str("`") | str("{") | str("+") | str("*") | str("}") | str("<") | str(">") | str("?") | str("_") | str("\\n") | str("\s") | str("\t") }

  rule(:string) {
    str("\"") >> chars.repeat >> str("\"")
  }

  rule(:var) {
    match("[a-z]") >> match("[a-zA-Z1234567890]").repeat
  }

  rule(:integer) {
    match("[0-9]").repeat(1)
  }

  rule(:code) {
    (line >> str("\n")).repeat(1)
  }

  rule(:line) {
    func | assign | value | sprt?
  }

  rule(:func) {
    idens.map{|f| str(f)}.inject(:|) >> block
  }

  rule(:block){
    block_value | block_lists
  }

  rule(:block_value){
    str("(") >> sprt? >> line >> sprt? >> str(")")
  }

  rule(:block_lists){
    str("{") >> sprt? >> code >> sprt? >>str("}")
  }

  rule(:value){
    string | var | integer | func
  }

  rule(:assign) {
    var >> space? >> str("=") >> space? >> value
  }
end
f = open(ARGV[0])
code = []
while line = f.gets
  code.push(line)
end
f.close
NumericParser.new.parse(code.join("\n")+"\n")
np = NumericParser.new
