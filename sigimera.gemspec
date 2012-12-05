# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "sigimera/version"

Gem::Specification.new do |gem|
    gem.name          = "sigimera"
    gem.version       = Sigimera::VERSION
    gem.authors       = [ "Alex Oberhauser" ]
    gem.email         = [ "alex.oberhauser@sigimera.org" ]
    gem.licenses      = [ "MIT" ]
    gem.homepage      = "https://github.com/Sigimera/sigimera-ruby-client"
    gem.summary       = "This is the official ruby library for the Sigimera REST API."
    gem.description   = "This is the official ruby library for the Sigimera REST API. It encapsulates the authentication process in a secure way and simplifies the access to the Crises Information Platform."
    gem.files         = `git ls-files`.split("\n")
    gem.require_paths = [ "lib" ]
    gem.executables   << "sigimera"

    gem.add_runtime_dependency            "json"
    gem.add_runtime_dependency            "nokogiri"  # XML Parsing

    gem.add_development_dependency "rake"
    gem.add_development_dependency "rspec"
    gem.add_development_dependency "spork"
    gem.add_development_dependency "simplecov"
    gem.add_development_dependency "rspec_junit_formatter"
end
