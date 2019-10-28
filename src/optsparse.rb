require 'optparse'
class OptParse
  def parse_options(argv = ARGV)
    prgconfig = {debug: false}
    optvol = 0
    opts = OptionParser.new
    opts.on("-d","--debug","use debug mode. (default: #{prgconfig[:debug]})"){|v|
      prgconfig[:debug] = true
      optvol+=1
    }
    opts.program_name = "bittn"
    opts.banner += ' filename'
    begin
      args = opts.parse(argv)
    rescue OptionParser::InvalidOption => e
      usage e.message
    end

    return [prgconfig,args,optvol]
  end

  def run(argv = ARGV)
    return parse_options(argv)
  end
end
