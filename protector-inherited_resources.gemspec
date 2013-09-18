# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'protector/inherited_resources/version'

Gem::Specification.new do |spec|
  spec.name          = "protector-inherited_resources"
  spec.version       = Protector::InheritedResources::VERSION
  spec.authors       = ["Sergey Gridasov"]
  spec.email         = ["grindars@gmail.com"]
  spec.description   = %q{Integration layer between Protector and Inherited Resources}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/grindars/protector-inherited_resources"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "protector", ">= 0.6.4"
  spec.add_dependency "inherited_resources"
  spec.add_dependency "activesupport"
end
