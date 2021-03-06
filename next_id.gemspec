# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "next_id/version"

Gem::Specification.new do |spec|
  spec.name    = "next_id"
  spec.version = NextId::VERSION
  spec.authors = ["unact"]

  spec.summary = "next_id"
  spec.license = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "sqlanywhere", ">= 0.1.6"
  spec.add_dependency "activerecord", ">= 4.1.8"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "composite_primary_keys", ">= 7.0.16"
end
