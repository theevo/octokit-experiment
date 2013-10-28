#octokit-experiment

## Organizations

This is an __array__ containing all of the organizations to which you are a member.

```shell
$ user.rels[:organizations].get.data.class
  => Array
```

Get the name (aka login) of the first organization.

```shell
$ user.rels[:organizations].get.data.first.login
```

Let's assume first org is what we want to work with.

See all repos?

```shell
$ user.rels[:organizations].get.data.first[:rels][:repos].head.data
```

_this experiment was jump started with [aspen](http://rubygems.org/gems/aspen)_