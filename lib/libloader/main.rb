def libloader()
  require_lists = [
    "#{ENV["BITTNDIR"]}/src/main.rb",
    "#{ENV["BITTNDIR"]}/src/optsparse.rb",
    "#{ENV["BITTNDIR"]}/src/error.rb",
    "#{ENV["BITTNDIR"]}/src/transform.rb",
    "#{ENV["BITTNDIR"]}/src/run.rb",
  ]

  Dir.glob("#{ENV["BITTNDIR"]}/lib/l-*/").each do |f|
    if !File.exist?("#{f}src/main.rb")
      raise BittnError, "Local library's main file is not exist. (LoadError)"
    else
      require_lists.push("#{f}src/main.rb")
    end
  end

  Dir.glob("#{ENV["BITTNDIR"]}/lib/g-*/").each do |f|
    if !File.exist?("#{f}src/main.rb")
      raise BittnError, "Global library's main file is not exist. (LoadError)"
    else
      require_lists.push("#{f}src/main.rb")
    end
  end

  s = require_lists.select { |n| n != caller[0][/^([^:]+):\d+:in `[^']*'$/, 1] }
  return s
end
