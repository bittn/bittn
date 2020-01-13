require 'dotenv'
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"
require "#{ENV["BITTNDIR"]}/lib/bike/main.rb"
class Run
  def initialize(argv)
    Dotenv.load! ".bike/.bike_en"
    require "#{ENV["BITTNDIR"]}/src/main.rb"
    Bittn.new(argv.unshift(ENV["BIKEFILE"]))
  end
end
