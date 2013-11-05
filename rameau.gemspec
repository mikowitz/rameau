# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rameau/version'

Gem::Specification.new do |spec|
  spec.name          = "rameau"
  spec.version       = Rameau::VERSION
  spec.authors       = ["Michael Berkowitz"]
  spec.email         = ["michael.berkowitz@gmail.com"]
  spec.description   = %q{A small library for exploring basic concepts of music theory.}
  spec.summary       = %q{A small library for exploring basic concepts of music theory.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
