require 'dotenv'
Dotenv.load! ".bike/.bike_env"
require_relative '#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb'
require_relative '#{ENV["BITTNDIR"]}/src/main.rb'
class Run < Bike
  def initialize(argv)
    Bittn.new(argv.unshift(ENV["BIKEFILE"]))
  end
end
