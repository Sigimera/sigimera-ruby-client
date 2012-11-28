require 'spork'

Spork.prefork do
    require 'simplecov'
    SimpleCov.start do
        add_filter 'spec'
    end

    RSpec.configure do |config|
        config.mock_with :rspec
    end

end

require "sigimera"
