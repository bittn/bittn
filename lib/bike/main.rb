require "#{ENV["BITTNDIR"]}/src/main.rb"
require "#{ENV["BITTNDIR"]}/src/error.rb"
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"
@prgconfig = {}
begin
  require 'fileutils'
  require "#{ENV["BITTNDIR"]}/lib/bike/optsparse.rb"
  require "#{ENV["BITTNDIR"]}/lib/bike/init/main.rb"
  require "#{ENV["BITTNDIR"]}/lib/bike/run/main.rb"
  require "#{ENV["BITTNDIR"]}/lib/bike/set/main.rb"
  class Bike < Bittn
    def initialize(argv)
      # optparse --------------------------
      opts = OptParse.new(argv)
      @prgconfig,args,optvol = opts.run
      if @prgconfig[:debug]
        newblock()
        puts "---------------- START DEBUG ------------------------------------"
        newblock()
      end
      if @prgconfig[:debug]
        newval(@prgconfig,"@prgconfig")
        newval(args,"args")
        newval(optvol,"optvol")
      end
      newblock("inputs") if @prgconfig[:debug]
      if args.size < 1
        raise BikeError,"Command not specified. (FileError)"
      end
      command = args
      newval(command,"command") if @prgconfig[:debug]
      case command[0]
      when "init"
        Bike::Init.new(command)
      when "run"
        Bike::Run.new(command)
      when "set"
        Bike::Set.new(command)
      end
    end
  end
  Bike.new(ARGV)
rescue BikeError => e
  newblock("bittn error") if @prgconfig[:debug]
  puts e.message
  exit(1)
rescue Errno => e
  newblock("dotenv error") if @prgconfig[:debug]
  puts "There isn't Bikefile.rb!"
  puts "Please run 'bike init`"
  exit(1)
rescue StandardError => e
  #newblock("standard error") if @prgconfig[:debug]
  if @prgconfig[:debug]
    raise
  else
    puts "--------------------------!error!--------------------------------"
    puts e.message
    puts "Traceback : "
    puts $@
    puts "-----------------------------------------------------------------"
    puts "An error is occurred in the processing system"
    puts "You can issue issues on Github."
    puts "https://github.com/pinenut-programming-language/bittn/issues/new"
    puts "-----------------------------------------------------------------"
  end
  exit(1)
end
