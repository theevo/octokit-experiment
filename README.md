# octokit-experiment

## Install

1. clone me
1. `cd` into this directory 
1. create `config/login.rb` set `MY_LOGIN` and `MY_PASSWORD` (see below)
1. `ruby bin/trial.rb`
1. add `binding.pry` to `trial.rb` to play with the `client` object

### config/login.rb -- you create this

```
# config/login.rb

MY_LOGIN = 'YOUR GITHUB USERNAME GOES HERE'
MY_PASSWORD = 'YOUR PASSWORD GOES HERE'
```

## Cheat Sheet

### Private Repos of the Organzation

```ruby
client.organization_repositories('camelback', :type => 'private')
```

## Helpful Advice when using Octokit

Know what is possible first using the curl commands from the Github API documentation before you start prying shit in Octokit that doesn't exist.

### What is possible with the Github API?

Before you start doing stuff in Octokit. Get a feel first for how you reference what you want from Github using a simple `curl` call.

Example: I want to show all _private_ repos of the camelback organization. I found this documentation:
http://developer.github.com/v3/repos/#list-organization-repositories

Now I try to run this in my terminal.

```shell
curl -u rails_noob -i https://api.github.com/orgs/camelback/repos?type=private
```

It looks like it works. Time to say the same thing using Octokit.

### Prying Sawyer objects

Octokit::Client is a complex object containing a labyrinth of nested Sawyer objects. Not going to go into what it is technically, all I can say is that `gem install pry` is now your bff.

```ruby
# bin/trial.rb

client = Octokit::Client.new \
  :login => MY_LOGIN,
  :password => MY_PASSWORD

binding.pry
```

```shell
$ ruby bin/trial.rb

pry> cd client
pry> ls
pry> show-source organization_repositories
pry> show-source (any method you see in ls)
```

## Resources

Github API -- try out the curl examples for what you're looking for first!
http://developer.github.com/v3/

Octokit Readme
https://github.com/octokit/octokit.rb/blob/master/README.md

Octokit::Client::Repositories
http://rdoc.info/github/pengwynn/octokit/Octokit/Client/Repositories

Sawyer Class
http://rubydoc.info/gems/sawyer/0.5.1/frames

* Send `.get.data` to a `Sawyer::Relation` object

```ruby
<Sawyer::Relation: members: get #<Addressable::Template:0x007f9fb2659df8>
```

_this experiment was jump started with [aspen](http://rubygems.org/gems/aspen)_