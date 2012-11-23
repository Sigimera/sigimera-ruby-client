require "spec_helper"

describe Sigimera::Client do

	before(:all) do
		ENV['AUTH_TOKEN'].should_not be_empty
		@auth_token = ENV['AUTH_TOKEN']
	end

    it "Get latest crises" do
        client = Sigimera::Client.new(auth_token = @auth_token)
        crises = client.get_latest_crises
        crises.class.should eql(Array)
        crises.size.should == 10
        crises.each do |crisis|
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end
end
