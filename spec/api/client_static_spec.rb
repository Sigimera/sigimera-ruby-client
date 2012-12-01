# encoding: UTF-8
require "spec_helper"

describe Sigimera::Client do

	before(:all) do
        @username = ENV['USERNAME']
        @password = ENV['PASSWORD']
	end

    it ".get_auth_token(username, password)" do
        if @username and @password
            sleep 1 # Respect the courtesy limit and wait for one second
            auth_token = Sigimera::Client.get_auth_token(username = @username, password = @password)
            auth_token.class.should eql(String)
            auth_token.should_not be_empty
        else
            pending "Please specify ENV['USERNAME'] and ENV['PASSWORD']"
        end
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

end
