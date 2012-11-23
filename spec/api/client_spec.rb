require "spec_helper"

describe Sigimera::Client do

	before(:all) do
		ENV['AUTH_TOKEN'].should_not be_empty
		@auth_token = ENV['AUTH_TOKEN']
	end

    it "Get latest crises" do
        client = Sigimera::Client.new(auth_token = @auth_token)
        STDERR.puts client.get_latest_crises
    end
end
