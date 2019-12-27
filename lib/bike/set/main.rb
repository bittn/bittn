require "#{ENV["BITTNDIR"]}/lib/bike/init/optsparse.rb"
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"
require 'dotenv'

class Set
  def initialize(argv)
    # optparse --------------------------
    Dotenv.load! ".bike/.bike_env"
    opts = OptParse.new(argv)
    prgconfig,args,optvol = opts.run
    if prgconfig[:debug]
      newblock()
      puts "---------------- START DEBUG ------------------------------------"
      newblock()
    end
    if prgconfig[:debug]
      newval(prgconfig,"prgconfig")
      newval(args,"args")
      newval(optvol,"optvol")
    end
    newblock("inputs") if prgconfig[:debug]
    if args.size > 1
      raise BikeError,"Number of arguments is more than 1. (LoadError)"
    end
    if args.size < 1
      raise BikeError,"Please check file. (LoadError)"
    end
    run(args)
  end
  def run(args)
    ENV["BIKEFILE"] = args[0]
    puts "BIKEFILE is #{args[0]}"
  end
end
