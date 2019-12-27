require 'optparse'
class OptParse
  def parse_options(argv = ARGV)
    prgconfig = {debug: false}
    optvol = 0
    opts = OptionParser.new
    # opts.on("-d","--debug"," (default: #{prgconfig[:debug]})"){|v|
    #   prgconfig[:debug] = true
    #   optvol+=1
    # }
    opts.program_name = "bike init"
    opts.banner = 'bike init [option]'
    tags = Array.new
    `cd #{ENV["BITTNDIR"]};git tag`.chomp.split("\n").each do |t|
      tags.push(Gem::Version.create(t.gsub(/[^[\.\d]]/, "")))
    end
    opts.version = tags.max.to_s
    opts.release  = 'dev'
    opts.on('-h','--help', 'show help.') { puts opts.help; exit }
    opts.on('-v','--version', 'show version.') { puts opts.ver; exit }
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
