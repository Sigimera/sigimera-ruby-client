$:.push File.expand_path("../lib", __FILE__)

require "sigimera/version"

Gem::Specification.new do |s|
    s.name          = "sigimera"
    s.version       = Sigimera::VERSION
    s.authors       = [ "Alex Oberhauser" ]
    s.email         = [ "alex.oberhauser@sigimera.org" ]
    s.licenses      = [ "MIT" ]
    s.homepage      = "https://github.com/Sigimera/sigimera-ruby-client"
    s.summary       = "This is a ruby library that encapsulates access to the Sigimera REST API."
    s.description   = "This is a ruby library that encapsulates access to the Sigimera REST API."
    s.files         = `git ls-files`.split("\n")
    s.require_paths = [ "lib" ]

    s.add_runtime_dependency            "json"
    s.add_runtime_dependency            "nokogiri"  # XML Parsing

    s.add_development_dependency "rake"
    s.add_development_dependency "rspec"
    s.add_development_dependency "spork"
end
