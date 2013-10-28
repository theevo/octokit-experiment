require_relative '../config/environment'

client = Octokit::Client.new \
  :login => MY_LOGIN,
  :password => MY_PASSWORD

user = client.user
binding.pry