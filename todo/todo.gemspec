# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'todo/version'

Gem::Specification.new do |spec|  spec.name          = "todo"
  spec.version       = Todo::VERSION
  spec.authors       = ["k2works"]
  spec.email         = ["kakimomokuri@gmail.com"]
  spec.summary       = %q{Sample}
  spec.description   = %q{Sample CommandLine App}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 3.2.0"
  spec.add_dependency "sqlite3",      "~> 1.3.0"
  spec.add_dependency "sinatra",      "~> 1.4.0"
  spec.add_dependency "haml",         "~> 4.0.0"
  spec.add_development_dependency "bundler",   "~> 1.7"
  spec.add_development_dependency "rake",      "~> 10.0"
  spec.add_development_dependency "yard",      "~> 0.8"
  spec.add_development_dependency "redcarpet", "~> 2.2"
end
