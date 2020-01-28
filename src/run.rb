class BittnRunner
  def initialize(lang)
    @lang = Marshal.load(lang)
  end
  def run(path,hash)
    p hash
    node = Marshal.load(hash)
    case @lang.getKinds[node]
    when :obj
      # p node.methods
      node.call()
    when :type
      node.exec()
    else
      raise "There isn't kinds of #{@lang.kinds[node]}"
    end
  end
end
