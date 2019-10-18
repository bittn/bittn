class Lexer
  def initialize(inputfilename)
    @idntfs = ["print","prinf"]
    @code = []
    File.open(inputfilename, "r") do |f|
      @code.push("f")
    end
    @filename=inputfilename
    @line = @code[0].split
    @line.push("EOF")
    @linenumber = 1
    @char = @line[0]
    @charnumber = 0
    @tokens = []
    @space = ""
    @salphas = ("a".."x").to_a
    @balphas = ("A".."X").to_a
    @alphas = @salphas+@balphas
  end

  def run
    loop do
      if @char == "EOF"
        @tokens.push([:TOK_EOF,"EOF"])
        break
      elsif ["(",")"," ","=","-","+","*","/"].include?(@char)
        @tokens.push(@char,@chars)
      elsif [0,1,2,3,4,5,6,7,8,9].map(&:to_s).include?(@char)
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
        if @idntfs.include?(alps.join)
          @tokens.push(["TOK_IDENTIFIERS",alps.join])
        elsif ["int"].include?(alps.join)
          @tokens.push(["TOK_TYPE",alps.join])
        else
          @tokens.push(["TOK_CHAR",alps.join])
        end
      else
        error("Undefind letter #{@char} (NameError)")
        exit(1)
      end
    end
    return @tokens
  end

  def getNextChar
    if @line[@charnumber+1] == nil
      getNextLine()
    end
    @char = @line[@charnumber+1]
    @charnumber += 1
  end

  def getNextLine
    @line = @code[@linenumber]
    @linenumber+=1
  end

  def error(err)
    puts "#{@filename}:#{@linenumber} #{err}"
  end
end
