# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "proc_source/version"

Gem::Specification.new do |spec|
  spec.name          = "proc_source"
  spec.version       = ProcSource::VERSION
  spec.authors       = ["siman-man"]
  spec.email         = ["tmshuichi@gmail.com"]

  spec.summary       = %q{get the sourcecode for a Proc object}
  spec.description   = %q{get the sourcecode for a Proc object}
  spec.homepage      = "https://github.com/siman-man/proc_source"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
