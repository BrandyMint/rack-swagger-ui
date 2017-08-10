# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack-swagger-ui/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-swagger-ui"
  gem.version       = Rack::Swagger::Ui::VERSION
  gem.authors       = ["Adam Martak"]
  gem.email         = ["adam.martak@railsformers.com"]
  gem.description   = %q{swagger ui js integration for grape and rack-swagger}
  gem.summary       = %q{swagger ui js integration for grape and rack-swagger}
  gem.license       = 'MIT'
  gem.homepage      = "https://github.com/adammartak/rack-swagger-ui"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rack'
end
