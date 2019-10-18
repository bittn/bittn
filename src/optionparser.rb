class OptionParse
  def initialize(opts)
    @opts = opts
  end
  def lexer
    @opts.gsub!(/-d/, "--debug")
  end
end
