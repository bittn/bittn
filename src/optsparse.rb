require "optparse"
require "#{ENV["BITTNDIR"]}/lib/libloader/main.rb"
libloader().each { |n| require n }

class OptParse
  def parse_options(argv = ARGV)
    prgconfig = { debug: false, parse_only: false, transfrom_only: false, byebug: false }
    optvol = 0
    opts = OptionParser.new
    opts.on("-d", "--debug", "use debug mode. (default: #{prgconfig[:debug]})") { |v|
      prgconfig[:debug] = true
      optvol += 1
    }
    opts.on("-b", "--byebug", "use byebug. (default: #{prgconfig[:byebug]})") { |v|
      prgconfig[:byebug] = true
      optvol += 1
    }
    opts.on("-p", "--parse-only", "parse only (default: #{prgconfig[:debug]})") { |v|
      prgconfig[:parse_only] = true
      optvol += 1
    }
    opts.on("-t", "--transorm-only", "parse and transform only (default: #{prgconfig[:debug]})") { |v|
      prgconfig[:transform_only] = true
      optvol += 1
    }
    opts.program_name = "bittn"
    tags = Array.new
    `cd #{ENV["BITTNDIR"]};git tag`.chomp.split("\n").each do |t|
      tags.push(Gem::Version.create(t.gsub(/[^[\.\d]]/, "")))
    end
    opts.version = tags.max.to_s
    opts.release = "release"
    opts.banner = "Usage: bittn [options] [bikefile] [filename]"
    opts.on("-h", "--help", "show help.") { puts opts.help; exit }
    opts.on("-v", "--version", "show version.") { puts opts.ver; exit }
    begin
      args = opts.parse(argv)
    rescue OptionParser::InvalidOption => e
      usage e.message
    end

    return [prgconfig, args, optvol]
  end

  def run(argv = ARGV)
    return parse_options(argv)
  end
end

if $0 == __FILE__
  puts "to debug, ARGV :"
  argv = gets.chomp
  opts = OptParse.new(argv)
  prgconfig, args, optvol = opts.run
  puts "prgconfig :"
  pp prgconfig
  puts "args :"
  pp args
  puts "optvol :"
  pp optvol
end
