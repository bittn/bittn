class Parser
  def initialize(inputfilename,prgconfig)
    @prgconfig = prgconfig
    @lines = []
    @filename = inputfilename
    File.open(@filename,"r") do |f|
      @lines.push(f.read.chomp)
    end
    @code = @lines.join("\n")
  end
  def run
    return Ripper.sexp_raw(@code)
  end
end
