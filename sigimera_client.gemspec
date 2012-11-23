$:.push File.expand_path("../lib", __FILE__)

require "sigimera_client/version"

Gem::Specification.new do |s|
    s.name          = "sigimera_client"
    s.version       = SigimeraClient::VERSION
    s.authors       = [ "Alex Oberhauser" ]
    s.email         = [ "alex.oberhauser@sigimera.org" ]
    s.licenses      = [ "MIT" ]
    s.homepage      = "https://github.com/Sigimera/sigimera-ruby-client"
    s.summary       = "SigimeraClient is a ruby library that encapsulates access to the Sigimera REST API."
    s.description   = "SigimeraClient is a ruby library that encapsulates access to the Sigimera REST API."
    s.files         = `git ls-files`.split("\n")
    s.require_paths = [ "lib" ]
end
