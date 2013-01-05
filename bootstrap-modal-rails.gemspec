# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootstrap-modal-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "bootstrap-modal-rails"
  gem.version       = Bootstrap::Modal::Rails::VERSION
  gem.authors       = ["Vicente Reig"]
  gem.email         = ["vicente.reig@gmail.com"]
  gem.description   = %q{Rails gemified bootstrap-modal extension}
  gem.summary       = %q{Rails gemified bootstrap-modal extension by Jordan Schroter.}
  gem.homepage      = "http://github.com/vicentereig/bootstrap-modal-rails"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.files         = Dir["{lib,vendor}/**/*"] + ["LICENSE.txt", "README.md"]
  gem.add_dependency "railties", ">= 3.1"
end
