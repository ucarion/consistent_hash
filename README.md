# ConsistentHash

A simple Ruby library that gives `String` the method `#consistent_hash`, which
will return consistent values, even between different instances of MRI.

This entire gem is basically just a dozen lines of C. The code is written as a C
extension so that it can perform as well as `String#hash`. (See the section on
performance.)

`String#consistent_hash` and Java's `String#hashCode` methods do exactly the
same thing, and return the same results. This library is not re-inventing the
string hash function, it's just implementing an alternative to Ruby's built-in
`#hash`.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'consistent_hash'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install consistent_hash
```

## Motivation

Every time you restart Ruby, the values returned from `String#hash` are changed:

```sh
$ irb
2.0.0p353 :001 > "hello".hash
 => 482951767139383391
2.0.0p353 :002 > exit

$ irb
2.0.0p353 :001 > "hello".hash
 => 3216751850140847920
2.0.0p353 :002 > exit
```

This means you cannot rely on the value of `String#hash` to precalculate some
data about a string and store the value of `#hash` in a database, because if you
restart your Ruby program, the values of `String#hash` will be completely
changed.

But with `#consistent_hash`, this is no longer the case:

```sh
$ irb
2.0.0-p353 :001 > require 'consistent_hash'
 => true
2.0.0-p353 :002 > "hello".consistent_hash
 => 99162322
 2.0.0-p353 :003 > exit

$ irb
2.0.0-p353 :001 > require 'consistent_hash'
 => true
2.0.0-p353 :002 > "hello".consistent_hash
 => 99162322
 2.0.0-p353 :003 > exit
```

## Performance

If you're concerned about how fast your hash function is, `#consistent_hash`
will work for you. Because this library is written in C, it's almost as fast as
the built-in hash function, and it's a few orders of magnitude faster than any
Ruby code:

```
                 user     system      total        real
naive:      35.620000   0.220000  35.840000 ( 35.841524) # this is written in Ruby
ruby:       30.460000   0.180000  30.640000 ( 30.644228) # this is written in Ruby
c:           0.010000   0.000000   0.010000 (  0.005697) # this is #consistent_hash
std hash:    0.000000   0.000000   0.000000 (  0.003163) # this is String#hash
```

(See [benchmark.rb](benchmark.rb))

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
