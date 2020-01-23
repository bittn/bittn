require 'parslet'
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"

class BittnLang
  def name
    return "BittnTestLang"
  end
  def version
    # version(-release)?
    # To check
    # $ ruby -e "p Gem::Version.correct?(\"1.0.0-dev2\")"
    return Gem::Version.create("0.0.0-dev")
  end
  def parser
    return BittnParser
  end
  def objects
    objects = {
      "print": BittnLangPrint
    }
    return objects
  end
end

class BittnLangPrint
  def initialize()
end

class BittnParser < Parslet::Parser
  idens = ["print"]
  root(:code)
  rule(:space){ str(" ") }
  rule(:spaces){ space.repeat(1) }
  rule(:space?){ spaces.maybe }
  rule(:return_mark){ str("\n") }
  rule(:returns){ return_mark.repeat(1) }
  rule(:return?){ returns.maybe }
  rule(:sprt?){ (return_mark | space).repeat(0)}
  rule(:chars){ str("!") | str("#") | str("$") | str("%") | str("&") | str("") | str("(") | str(")") | str("*") | str("+") | str(",") | str("-") | str(".") | str("/") | str("0") | match("[0-9]") | str(":") | str(";") | str("<") | str("=") | str(">") | str("?") | str("@") | match("[A-Z]") | str("[") | str("\\") | str("]") | str("^") | str("_") | str("`") | match("[a-z]") | str("{") | str("|") | str("}") | str("~") | str("\\\"") }

  rule(:string) {
    str("\"") >> chars.repeat >> str("\"")
  }

  rule(:var) {
    match("[a-z]") >> match("[a-zA-Z1234567890]").repeat
  }

  rule(:integer) {
    match("[0-9]")
  }

  rule(:code) {
    (line >> str("\n")).repeat(1)
  }

  rule(:line) {
    func | assign | value | sprt?
  }

  rule(:func) {
    match("#{idens.join("|")}") >> param
  }

  rule(:param){
    str("(") >> sprt? >> line >> sprt? >> str
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
