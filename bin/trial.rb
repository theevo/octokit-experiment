require_relative '../config/environment'

client = Octokit::Client.new \
  :login => MY_LOGIN,
  :password => MY_PASSWORD

user = client.user

puts "FLATIRON REPO NAMES"
user.rels[:organizations].get.data[0][:rels][:repos].head.data.each do |repo|
  puts "#{repo.name} | #{repo.full_name}"
end
