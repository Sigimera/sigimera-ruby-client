# encoding: UTF-8
require "spec_helper"

describe Sigimera::Client do

	before(:all) do
		auth_token = ENV['AUTH_TOKEN']
        if auth_token
            sleep 1 # Respect the courtesy limit and wait for one second
            @client = Sigimera::Client.new(auth_token = auth_token)
        else
            pending "Plese specify ENV['AUTH_TOKEN']"
        end
	end

    it "#get_crises_stat" do
        crises_stat = @client.get_crises_stat
        crises_stat['first_crisis_at'].should eql("2012-03-07T00:00:00Z")
        crises_stat['total_crises'].class.should eql(Fixnum)
    end

    it "#get_user_stat" do
        sleep 1 # Respect the courtesy limit and wait for one second
        user_stat = @client.get_user_stat
        number_of_calls = user_stat['api_calls']['number_of_calls']
        number_of_calls.should > 0

        sleep 1 # Respect the courtesy limit and wait for one second
        second_user_stat = @client.get_user_stat
        second_user_stat['api_calls']['number_of_calls'].should >= (number_of_calls + 1)
    end

end
