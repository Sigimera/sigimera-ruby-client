require 'spork'

Spork.prefork do
    require 'simplecov'
    SimpleCov.start

    RSpec.configure do |config|
        config.mock_with :rspec
    end

end

require "sigimera"
