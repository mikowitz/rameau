# Rameau

A small library for exploring basic concepts of music theory.

## Installation

Add this line to your application's Gemfile:

    gem 'rameau'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rameau

## Usage

Include Rameau in your environment

    $ require 'rameau'
    $ include Rameau

This gives you access to `Rameau`'s predefined constants

* pitch classes: `C`, `Cs`, `D`, `Ef`, etc., and  
* intervals: `Unison`, `MajorSecond`, `PerfectFourth`, etc.

These can be used to determine the interval between pitch classes:

    $ C.to(D) == MajorSecond  #=> true
    $ F.down_to(D) == MinorThird #=> true

or to find the pitch class a given interval from another:

    $ MajorSecond.from(C) == D #=> true
    $ PerfectFourth.down_from(G) == D #=> true

These can be combined to transpose intervals:

    $ C.to(D).from(Ef) == F #=> true
    $ C.to(E).down_from(G) == Ef #= true

## TODO

* Support for at least basic triads
* A REPL-based quiz-like interface for practicing
* Better `#inspect`/`#to_s` values for pitch classes and intervals

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
