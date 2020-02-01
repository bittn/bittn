require 'parslet'
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"

# ----- Sample ---------- #
# class ****Node          #
#   def initialize(data)  #
#   @data = data          #
#   end                   #
#   def call()            #
#   end                   #
# end                     #
#                         #
# class ****Node          #
#   def initialize(data)  #
#     @data = data        #
#   end                   #
#   def exec()            #
#   end                   #
# end                     #
# ----------------------- #



class BittnTestLang2Parser < Parslet::Parser
  idens = ["print"]
  root(:code)
  rule(:space){ str(" ") }
  rule(:spaces){ space.repeat(1) }
  rule(:space?){ spaces.maybe }
  rule(:return_mark){ str("\n") }
  rule(:returns){ return_mark.repeat(1) }
  rule(:return?){ returns.maybe }
  rule(:sprt?){ (return_mark | space).repeat(0)}
  rule(:sprt){ (return_mark | space).repeat(1)}
  rule(:chars){ str("a") | str("b") | str("c") | str("d") | str("e") | str("f") | str("g") | str("h") | str("i") | str("j") | str("k") | str("l") | str("m") | str("n") | str("o") | str("p") | str("q") | str("r") | str("s") | str("t") | str("u") | str("v") | str("w") | str("x") | str("y") | str("z") | str("A") | str("B") | str("C") | str("D") | str("E") | str("F") | str("G") | str("H") | str("I") | str("J") | str("K") | str("L") | str("M") | str("N") | str("O") | str("P") | str("Q") | str("R") | str("S") | str("T") | str("U") | str("V") | str("W") | str("X") | str("Y") | str("Z") | str("0") | str("1") | str("2") | str("3") | str("4") | str("5") | str("6") | str("7") | str("8") | str("9") | str(" ") | str("!") | str("\\\"") | str("#") | str("$") | str("%") | str("&") | str("\\'") | str("(") | str(")") | str("-") | str("^") | str("@") | str("[") | str(";") | str(":") | str("]") | str(",") | str(".") | str("/") | str("\\\\") | str("=") | str("~") | str("|") | str("`") | str("{") | str("+") | str("*") | str("}") | str("<") | str(">") | str("?") | str("_") | str("\\n") | str("\s") | str("\t") }

  rule(:string) {
    str("\"") >> chars.repeat.as(:chars) >> str("\"")
  }

  # rule(:var) {
  #   match("[a-z]") >> match("[a-zA-Z1234567890]").repeat
  # }

  rule(:integer) {
    match("[0-9]").repeat(1)
  }

  rule(:code) {
    (line.as(:line) | sprt).repeat(0).as(:code)
    # (line.repeat(1).as(:line) | str("")).as(:code)
  }

  rule(:line) {
    func.as(:func) | value.as(:value)
  }

  rule(:func) {
    idens.map{|f| str(f)}.inject(:|).as(:idens) >> param
  }

  rule(:param){
    str("(") >> sprt? >> ( sprt? >> line.as(:param) >> sprt? >> (sprt? >> str(",") >> sprt? >> line.as(:param) >> sprt?).repeat(0)).maybe >> sprt? >> str(")")
# >> block.maybe.as(:block)
  }

  # rule(:block){
  #   str("{") >> sprt? >> code.as(:code) >> sprt? >>str("}")
  # }

  rule(:value){
    string.as(:string) | integer.as(:integer)
  }
end



class Lang
  def initialize
    @name = "BittnTestLang2"
    @version = Gem::Version.create("0.0.0-dev")
    @parser = Marshal.dump(BittnTestLang2Parser.new)
    @kinds = {
      "CodeNode" => :obj,
      "LineNode" => :obj,
      "FuncNode" => :obj,
      "IdensNode" => :type,
      "ParamNode" => :obj,
      "ValueNode" => :obj,
      "StringNodee" => :type,
      "IntegerNode" => :type
    }
    @obj = {
      # Marshal.dump(PrintNode.new)
      :code => Marshal.dump(CodeNode),
      :line => Marshal.dump(LineNode),
      :func => Marshal.dump(FuncNode),
      :param => Marshal.dump(ParamNode),
      :value => Marshal.dump(ValueNode)

    }
    @type = {
      :idens => Marshal.dump(IdensNode),
      :string => Marshal.dump(StringNode),
      :integer => Marshal.dump(IntegerNode)
    }
  end
  def getName
    return @name
  end
  def getVersion
    return @version
  end
  def getParser
    return @parser
  end
  def getObj
    return @obj
  end
  def getType
    return @type
  end
  def getKinds
    return @kinds
  end
end

class CodeNode
  def initialize(data)
    @data = data
  end
  def call()
    @data.each do |hash|
      Marshal.load(hash[0]).call
    end
  end
  def class_name
    self.class.name
  end
end

class LineNode
  def initialize(data)
    @data = data
  end
  def call()
    Marshal.load(@data[0][0]).call
  end
  def class_name
    self.class.name
  end
end

class FuncNode
  def initialize(data)
    @data = data
  end
  def call()
    # pp @data
    idens = Marshal.load(@data[0][0]).exec
    param = Marshal.load(@data[0][1]).call

    case idens
    when "print"
      PrintNode.new(param).call
    end
  end
  def class_name
    self.class.name
  end
end

class PrintNode
  def initialize(data)
    @data = data
  end
  def call()
    print(@data)
  end
end

class IdensNode
  def initialize(data)
    @data = data
  end
  def exec()
    return @data.to_s
  end
  def class_name
    self.class.name
  end
end

class ParamNode
  def initialize(data)
    @data = data
  end
  def call()
    Marshal.load(@data[0][0]).call
  end
  def class_name
    self.class.name
  end
end

class ValueNode
  def initialize(data)
    @data = data
  end
  def call()
    Marshal.load(@data[0][0]).exec
  end
  def class_name
    self.class.name
  end
end

class StringNode
  def initialize(data)
    @data = data
  end
  def exec()
    # p @data
    return @data[:chars].to_s.gsub(/\\n/,"\n")
  end
  def class_name
    self.class.name
  end
end

class IntegerNode
  def initialize(data)
    @data = data
  end
  def exec()
    return data[0].to_i
  end
  def class_name
    self.class.name
  end
end
