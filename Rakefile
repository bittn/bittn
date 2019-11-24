task :default => :install

desc 'Install bittn programming language'
task :install do
  sh "read -sp \"Password: \" pass"
  # print("Password : ")
  # password = gets.chomp
  puts "=> gem install bundler"
  sh "echo #{password} | sudo -S gem install bundler"
  sh "echo $pass | sudo -S gem install bundler"
  puts '=> bundle install'
  # sh "echo #{password} | sudo -S bundle install"
  sh "echo $pass | sudo -S bundle install"
end
