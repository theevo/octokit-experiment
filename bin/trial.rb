require_relative '../config/environment'

client = Octokit::Client.new \
  :login => MY_LOGIN,
  :password => MY_PASSWORD

binding.pry

# useful pry commands: 
# 1. cd client
# 2. ls
# 3. show-source organization 
# 4. show-source (any method you see in ls)
