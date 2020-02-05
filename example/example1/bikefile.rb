require 'parslet'

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



class BittnTestLangParser < Parslet::Parser
  root(:code)
  rule(:code) {
    line.repeat(0).as(:code)
  }

  rule(:line) {
    (integer.as(:integer)).as(:line) >> str("\n") | str("\n")
  }

  rule(:integer){
    match("[0-9]").repeat(1)
  }
end



class Lang
  def initialize
    @name = "BittnTestLang"
    @version = Gem::Version.create("0.0.0-dev")
    @parser = Marshal.dump(BittnTestLangParser.new)
    @kinds = {
      "CodeNode" => :obj,
      "LineNode" => :obj,
      "IntegerNode" => :type
    }
    @obj = {
      # Marshal.dump(PrintNode.new)
      :code => Marshal.dump(CodeNode),
      :line => Marshal.dump(LineNode)

    }
    @type = {
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
    Marshal.load(@data[0][0]).call
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
    Marshal.load(@data[0][0]).exec
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
    return @data.to_i
  end
  def class_name
    self.class.name
  end
end
