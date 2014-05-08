# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'consistent_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "consistent_hash"
  spec.version       = ConsistentHash::VERSION
  spec.authors       = ["Ulysse Carion"]
  spec.email         = ["ulyssecarion@gmail.com"]
  spec.description   = %q{A string hash function that returns the same value each time it's called.}
  spec.summary       = %q{A consistent hash function for strings.}
  spec.homepage      = "https://github.com/ucarion/consistent_hash"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
  spec.add_development_dependency "rake-compiler"
end
