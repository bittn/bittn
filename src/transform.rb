require "#{ENV["BITTNDIR"]}/lib/libloader/main.rb"
libloader().each do |n|
  require n
end
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
    result = []
    eval("@hash#{path}").each do |key,value|
      if @obj[key]==nil && @type[key]==nil
        raise BittnError,"#{key} is not in @obj or @type."
      elsif @obj[key]!=nil && @type[key]!=nil
        raise BittnError,"#{key}is in @obj and @type."
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
        result.push(Marshal.dump(node.new(newvalue)))
      elsif @type[key]!=nil
        node = Marshal.load(@type[key])
        result.push(Marshal.dump(node.new(value)))
      end
    end
    return result
  end
end
