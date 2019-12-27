require 'dotenv'
require "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb"
require "#{ENV["BITTNDIR"]}/src/main.rb"
require "#{ENV["BITTNDIR"]}/lib/bike/main.rb"
class Run
  def initialize(argv)
    Dotenv.load! ".bike/.bike_en"
    Bittn.new(argv.unshift(ENV["BIKEFILE"]))
  end
end
