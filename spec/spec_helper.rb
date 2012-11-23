require 'spork'

Spork.prefork do
    RSpec.configure do |config|
        config.mock_with :rspec
    end
end

require "sigimera"
