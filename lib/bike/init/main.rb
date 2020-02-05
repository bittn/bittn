require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"
require "#{ENV["BITTNDIR"]}/lib/bike/main.rb"
require "#{ENV["BITTNDIR"]}/src/error.rb"

class BikeError < BittnError; end
class BikeInit
  def initialize(argv)
    # optparse --------------------------
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
    if args.size > 0
      raise BikeError,"Number of arguments is more than 0. (LoadError)"
    end
    run()
  end
  def run()
    if FileTest.exists?("Bikefile.rb")
      raise BikeError,"Bikefile already exists. (LoadError)"
    end
    if FileTest.exists?(".bike/.bike_env")
      raise BikeError,".bike/.bike_env already exists. (LoadError)"
    end
    FileUtils.mkdir_p('.bike/')
    FileUtils.cp("#{ENV["BITTNDIR"]}/lib/bike/Bikefile-ma.template.rb", ".bike/.bike_env")
    puts "existed Bikefile.rb and .bike/.bike_env"
  end
end
