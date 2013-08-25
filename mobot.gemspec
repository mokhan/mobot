# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mobot/version'

Gem::Specification.new do |spec|
  spec.name          = "mobot"
  spec.version       = Mobot::VERSION
  spec.authors       = ["mo khan"]
  spec.email         = ["mo@mokhan.ca"]
  spec.description   = %q{a simple robot}
  spec.summary       = %q{this is my personal robot.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
