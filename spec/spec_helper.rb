require 'spork'

Spork.prefork do
    require 'simplecov'
    require 'simplecov-rcov'
    SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
    SimpleCov.start

    RSpec.configure do |config|
        config.mock_with :rspec
    end

end

require "sigimera"
