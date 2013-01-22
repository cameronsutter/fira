# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fira/version'

Gem::Specification.new do |gem|
  gem.name          = "fira"
  gem.version       = Fira::VERSION
  gem.authors       = ["Cameron Sutter"]
  gem.email         = ["cameronsutter0@gmail.com"]
  gem.description   = %q{Adds improvements to HTML syntax for id and class attributes}
  gem.summary       = %q{Smarter HTML}
  gem.homepage      = "https://github.com/cameronsutter/fira"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
