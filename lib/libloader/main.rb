#caller[0][/^([^:]+):\d+:in `[^']*'$/, 1]
def prgram_load(file,prg=[])
  files = `find #{ENV["BITTNDIR"]} -name "*.rb"`.split("\n")
  #p files
  files.select!{|path|
    !(path.include?(file)) && !(prg.include?(path)) && !()
  }
  files.delete("")
  return files
end

if $0 == __FILE__
  file = ""
  prg = []
  puts "You can use regex in input."
  print "FILENAME: "
  file = gets.chomp
  if file==""
    file="shshshshsh"
  end
  print "PRG: "
  prg = gets.chomp.split(" ")
  if prg == []
    prg = ""
  end

  p Libloader.new.progam_load(file,prg)

  p caller[0][/^([^:]+):\d+:in `[^']*'$/, 1]
end
