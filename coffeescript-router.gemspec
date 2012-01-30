# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coffeescript-router/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tim Bugai"]
  gem.email         = ["tim@collectiveidea.com"]
  gem.description   = %q{Standalone CoffeeScript Router w/ Rails style named parameters}
  gem.summary       = %q{Standalone CoffeeScript Router}
  gem.homepage      = "http://github.com/tbugai/coffeescript-router"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "coffeescript-router"
  gem.require_paths = ["lib"]
  gem.version       = Coffeescript::Router::VERSION
  
  gem.add_dependency "rails", ">= 3.1"
end
