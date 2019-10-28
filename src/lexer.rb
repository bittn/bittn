class Lexer
  def initialize(inputfilename,prgconfig)
    @prgconfig = prgconfig
    @idntfs = ["print","prinf"]
    newval(@idntfs,"@idntfs") if prgconfig[:debug]
    @code = []
    @line = []
    File.open(inputfilename, "r") do |f|
      @code.push(f.read.chomp)
    end
    newval(@code,"@code") if prgconfig[:debug]
    @line = @code[0].split("")
    newval(@line,"@line") if prgconfig[:debug]
    @filename=inputfilename
    newval(@filename,"@filename") if prgconfig[:debug]
    @line.push("EOF")
    @linenumber = 1
    @char = @line[0]
    @charnumber = 0
    @tokens = []
    # @space = ""
    @salphas = ("a".."x").to_a
    newval(@salphas,"@salphas") if prgconfig[:debug]
    @balphas = ("A".."X").to_a
    newval(@balphas,"@balphas") if prgconfig[:debug]
    @alphas = @salphas+@balphas
    newval(@alphas,"@alphas") if prgconfig[:debug]
  end

  def run
    loop do
      if @char == "EOF"
        found("EOF")
        @tokens.push([:TOK_EOF,"EOF"])
        break
      elsif ["(",")"," ","=","-","+","*","\""].include?(@char)
        found("symbol")
        @tokens.push(@char,@chars)
        getNextChar()
      elsif [0,1,2,3,4,5,6,7,8,9].map(&:to_s).include?(@char)
        found("integer")
        nums = []
        nums.push(@char.to_i)
        loop do
          getNextChar()
          if [0,1,2,3,4,5,6,7,8,9].map(&:to_s).include?(@char)
            nums.push(@char.to_i)
          else
            break
          end
        end
        @tokens.push(["TOK_NUMBER",nums.join])
      elsif @salphas.include?(@char)
        alps = []
        alps.push(@char)
        loop do
          getNextChar()
          if @alphas.include?(@char)
            alps.push(@char)
          else
            break
          end
        end
        found(alps.join)
        if @idntfs.include?(alps.join)
          msg("#{alps.join} = TOK_IDENTIFIERS")
          @tokens.push(["TOK_IDENTIFIERS",alps.join])
        elsif ["int"].include?(alps.join)
          msg("#{alps.join} = TOK_TYPE")
          @tokens.push(["TOK_TYPE",alps.join])
        else
          msg("#{alps.join} = TOK_CHAR")
          @tokens.push(["TOK_CHAR",alps.join])
        end
      else
          raise BittnError,"#{@filename}:#{@linenumber} Undefind letter #{@char} (NameError)."
      end
    end
    return @tokens
  end

  def getNextChar
    msg("NextChar #{@charnumber+2}")
    if @line[@charnumber+1] == nil
      getNextLine()
    end
    @char = @line[@charnumber+1]
    @charnumber += 1
  end

  def getNextLine
    msg("NextLine #{@linenumber+1}")
    @line = @code[@linenumber]
    @linenumber+=1
  end
end
