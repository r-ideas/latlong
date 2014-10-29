# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'latlong/version'

Gem::Specification.new do |spec|
  spec.name          = 'latlong'
  spec.version       = Latlong::VERSION
  spec.authors       = ['Roman Greshny']
  spec.email         = ['greshny@gmail.com']
  spec.summary       = %q{Finds coordinates by address}
  spec.description   = %q{Finds coordinates by address}
  spec.homepage      = 'http://github.com/r-ideas/latlong'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'turn'

  spec.add_dependency 'geocoder'
end
