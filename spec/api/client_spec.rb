require "spec_helper"

describe Sigimera::Client do

	before(:all) do
		ENV['AUTH_TOKEN'].should_not be_empty
		@auth_token = ENV['AUTH_TOKEN']
	end

    it "#get_latest_crises" do
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

    it "#get_latest_crises(type = 'earthquakes')" do
    	sleep 1 # Respect the courtesy limit and wait for one second
		client = Sigimera::Client.new(auth_token = @auth_token)
        crises = client.get_latest_crises(type = "earthquakes")
        crises.class.should eql(Array)
        crises.size.should == 10
        crises.each do |crisis|
        	crisis['dc_subject'].first.should eql("earthquake")
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end

    it "#get_latest_crises(type = 'floods')" do
    	sleep 1 # Respect the courtesy limit and wait for one second
		client = Sigimera::Client.new(auth_token = @auth_token)
        crises = client.get_latest_crises(type = "floods")
        crises.class.should eql(Array)
        crises.size.should == 10
        crises.each do |crisis|
        	crisis['dc_subject'].first.should eql("flood")
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end

	it "#get_latest_crises(type = 'cyclones')" do
		sleep 1 # Respect the courtesy limit and wait for one second
		client = Sigimera::Client.new(auth_token = @auth_token)
        crises = client.get_latest_crises(type = "cyclones")
        crises.class.should eql(Array)
        crises.size.should == 10
        crises.each do |crisis|
        	crisis['dc_subject'].sort.last.should eql("tropical cyclones")
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end
end
