# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'raredio/version'

Gem::Specification.new do |spec|
  spec.name          = "raredio"
  spec.version       = Raredio::VERSION
  spec.authors       = ["Blair Anderson"]
  spec.email         = ["blair81@gmail.com"]
  spec.description   = %q{This is a client library for the raredio.herokuapp.com website to post songs}
  spec.summary       = %q{The Gem lets you create a song and get a single song.  This is a client library for the raredio.herokuapp.com website to post songs}
  spec.homepage      = "http://raredio.herokuapp.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
