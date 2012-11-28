# encoding: UTF-8
require "spec_helper"

describe Sigimera::Client do

	before(:all) do
		auth_token = ENV['AUTH_TOKEN']
        if auth_token
            @client = Sigimera::Client.new(auth_token = auth_token)
        else
            pending "Plese specify ENV['AUTH_TOKEN']"
        end
	end

    it "#get_latest_crises" do
        crises = @client.get_latest_crises
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
        crises =  @client.get_latest_crises(type = "earthquakes")
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
        crises = @client.get_latest_crises(type = "floods")
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
        crises = @client.get_latest_crises(type = "cyclones")
        crises.class.should eql(Array)
        crises.size.should == 10
        crises.each do |crisis|
            crisis['dc_subject'].sort.last.should eql("tropical cyclones")
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end

    it "#get_latest_crises(type = 'volcanoes')" do
        sleep 1 # Respect the courtesy limit and wait for one second
        crises = @client.get_latest_crises(type = "volcanoes")
        crises.class.should eql(Array)
        crises.size.should > 1
        crises.each do |crisis|
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end

    it "#get_crisis(identifier)" do
        sleep 1 # Respect the courtesy limit and wait for one second
        id = "a8763f7e2c432ebe897a68706dcf8dd49243774d"
        crisis = @client.get_crisis(id)
        crisis.class.should eql(Hash)
        crisis['_id'].should eql(id)
        crisis['dc_title'].should eql("Green flood alert in Australia")

        sleep 1 # Respect the courtesy limit and wait for one second
        crisis = @client.get_crisis("")
        crisis.class.should eql(NilClass)

        sleep 1 # Respect the courtesy limit and wait for one second
        crisis = @client.get_crisis(nil)
        crisis.class.should eql(NilClass)
    end

end
