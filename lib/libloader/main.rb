def libloader()
  require_lists = [
      "#{ENV["BITTNDIR"]}/src/main.rb",
      "#{ENV["BITTNDIR"]}/src/optsparse.rb",
      "#{ENV["BITTNDIR"]}/lib/yesorno/main.rb",
      "#{ENV["BITTNDIR"]}/lib/debugmsgs/main.rb",
      "#{ENV["BITTNDIR"]}/src/error.rb",
      "#{ENV["BITTNDIR"]}/src/transform.rb",
      "#{ENV["BITTNDIR"]}/lib/yesorno/main.rb",
      "#{ENV["BITTNDIR"]}/src/run.rb" ]
  s = require_lists.select{|n| n!=caller[0][/^([^:]+):\d+:in `[^']*'$/, 1]}
  p s
  return s
end
