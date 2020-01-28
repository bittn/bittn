class BittnTransformer
  def initialize(parser_result,lang)
    @hash = parser_result
    @lang = Marshal.load(lang)
    @obj = @lang.getObj
    @type = @lang.getType
    newhash = {}
  end
  # path = newhash
  def transform(path)
    eval("@hash#{path}").each do |key,value|
      if @obj[key]==nil && @type[key]==nil
        raise "#{@obj[key]}is not in @obj or @type.",BittnError
      elsif @obj[key]!=nil && @type[key]!=nil
        raise "#{@obj[key]}is in @obj and @type.",BittnError
      elsif @obj[key]!=nil
        node = Marshal.load(@obj[key])
        newvalue = []
        value.size.times do |n|
          if eval("@hash#{path}[:#{key}]").is_a?(Hash)
            newvalue[n] = transform(path+"[:#{key}]")
          else
            newvalue[n] = transform(path+"[:#{key}][#{n}]")
          end
        end
        node.new(newvalue)
        return Marshal.dump(node)
      elsif @type[:hash]!=nil
        node = Marshal.load(@type[key])
        node.new(value)
        return {key => value}
      end
    end
  end
end
