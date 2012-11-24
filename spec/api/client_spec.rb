require "spec_helper"

describe Sigimera::Client do

	before(:all) do
		ENV['AUTH_TOKEN'].should_not be_empty
		@auth_token = ENV['AUTH_TOKEN']
	end

    it ".get_api_version" do
        api_version = Sigimera::Client.get_api_version
        api_version.class.should eql(String)
        api_version.should start_with("1.")
    end

    it ".get_public_crises" do
        crises = Sigimera::Client.get_public_crises
        crises.class.should eql(Array)
        crises.size.should == 10
        crises.each do |crisis|
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end

    it ".get_public_rss_feed" do
        crises = Sigimera::Client.get_public_rss_feed
        crises.class.should eql(Nokogiri::XML::Document)
        crises.xpath("/rss/channel/link/text()").to_s.should eql("http://www.sigimera.org/")
        crises.xpath("/rss/channel/item").size.should == 10
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

    it "#get_latest_crises(type = 'volcanoes')" do
        sleep 1 # Respect the courtesy limit and wait for one second
        client = Sigimera::Client.new(auth_token = @auth_token)
        crises = client.get_latest_crises(type = "volcanoes")
        crises.class.should eql(Array)
        crises.size.should > 1
        crises.each do |crisis|
            crisis.class.should eql(Hash)
            crisis['_id'].class.should eql(String)
            crisis['_id'].should_not be_empty
        end
    end

    it "#get_crises_stat" do
        sleep 1 # Respect the courtesy limit and wait for one second
        client = Sigimera::Client.new(auth_token = @auth_token)
        crises_stat = client.get_crises_stat
        crises_stat['first_crisis_at'].should eql("2012-03-07T00:00:00Z")
        crises_stat['total_crises'].class.should eql(Fixnum)
    end

    it "#get_user_stat" do
        sleep 1 # Respect the courtesy limit and wait for one second
        client = Sigimera::Client.new(auth_token = @auth_token)
        user_stat = client.get_user_stat
        number_of_calls = user_stat['api_calls']['number_of_calls']
        number_of_calls.should > 0

        sleep 1 # Respect the courtesy limit and wait for one second
        second_user_stat = client.get_user_stat
        second_user_stat['api_calls']['number_of_calls'].should == (number_of_calls + 1)
    end
end
