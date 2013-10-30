#octokit-experiment

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

## Notes

### Organizations

```ruby
client.organization_repositories('___ORG___') # replace ___ORG___!
```

This is an __array__ containing all of the organizations to which you are a member.

```ruby
$ user.rels[:organizations].get.data.class
  => Array
```

Get the name (aka login) of the first organization.

```ruby
$ user.rels[:organizations].get.data.first.login
```

Let's assume first org is what we want to work with.

See all repos?

```ruby
$ user.rels[:organizations].get.data.first[:rels][:repos].head.data
```

get the name of the first repo
```ruby
user.rels[:organizations].get.data[0][:rels][:repos].head.data[0].name
```

path to first repo
```ruby
user.rels[:organizations].get.data[0][:rels][:repos].head.data[0].full_name
```

### Members of Organization

```ruby
user.rels[:organizations].get.data[0][:rels][:members].get.data
```

# Resources

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