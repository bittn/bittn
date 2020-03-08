require "#{ENV["BITTNDIR"]}/lib/libloader/main.rb"
libloader().each do |n|
  require n
end
class BittnRunner
  def initialize(lang)
    @lang = Marshal.load(lang)
  end
  def run(path,hash,bikefile)
    require bikefile
    node = Marshal.load(hash[0])
    # p node.class_name
    # p @lang.getKinds
    case @lang.getKinds[node.class_name]
    when :obj
      # p node.methods
      node.call()
    when :type
      node.exec()
    else
      raise "There isn't kinds of #{@lang.getKinds[node.class_name]}"
    end
  end
end

if $0 == __FILE__
  print("Lang: ")
  lang = gets.chomp
  print("hash: ")
  hash = gets.chomp

  BittnRunner.new(lang).run("",hash,"")

end
