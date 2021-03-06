# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ashikawa-ar/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["moonglum"]
  gem.email         = ["moonglum@moonbeamlabs.com"]
  gem.description   = %q{ArangoDB ODM for Ruby using the ActiveRecord Pattern}
  gem.summary       = %q{ArangoDB ODM for Ruby using the ActiveRecord Pattern.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ashikawa-ar"
  gem.require_paths = ["lib"]
  gem.version       = Ashikawa::AR::VERSION

  gem.add_dependency "ashikawa-core", "~> 0.3.0"
  gem.add_dependency "virtus", "~> 0.5.2"
  gem.add_dependency "aequitas", "~> 0.0.2"
  gem.add_dependency "activesupport", "~> 3.2.8"
  gem.add_dependency "activemodel", "~> 3.2.8"

  # Development Dependencies
  unless defined? PLATFORM and PLATFORM == 'java'
    gem.add_development_dependency "redcarpet", "~> 2.1.1"
  end

  gem.add_development_dependency "rake", "~> 0.9.2.2"
  gem.add_development_dependency "rspec", "~> 2.11.0"
  gem.add_development_dependency "yard", "~> 0.8.2.1"

  gem.add_development_dependency "guard", "~> 1.3.3"
  gem.add_development_dependency "guard-rspec", "~> 1.2.1"
  gem.add_development_dependency "guard-bundler", "~> 1.0.0"
  gem.add_development_dependency "guard-yard", "~> 2.0.0"
  gem.add_development_dependency "rb-fsevent", "~> 0.9.1"
end
