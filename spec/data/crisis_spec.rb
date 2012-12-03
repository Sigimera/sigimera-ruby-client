# encoding: UTF-8
require "spec_helper"

describe Sigimera::Crisis do 

	it "#new crisis_as_json" do
		json = {
			"_id" => "1234567890ABCDEFG",
			"dc_subject" => "cyclone",
			"test_hash" => {
				"key1" => "value1",
				"key2" => "value2"
			}
		}
		crisis = Sigimera::Crisis.new json

		# Access the fields with the help of ruby methods
		crisis._id.class.should eql(String)
		crisis._id.should eql("1234567890ABCDEFG")

		crisis.dc_subject.class.should eql(String)
		crisis.dc_subject.should eql("cyclone")

		test_hash = crisis.test_hash
		test_hash.class.should eql(Hash)
		test_hash['key1'].class.should eql(String)
		test_hash['key1'].should eql("value1")
		test_hash['key2'].class.should eql(String)
		test_hash['key2'].should eql("value2")

		crisis.no_method.should eql(nil)

		# Simulate JSON object behavior
		crisis['_id'].class.should eql(String)
		crisis['_id'].should eql("1234567890ABCDEFG")

		crisis['dc_subject'].class.should eql(String)
		crisis['dc_subject'].should eql("cyclone")

		test_hash = crisis['test_hash']
		test_hash.class.should eql(Hash)
		test_hash['key1'].class.should eql(String)
		test_hash['key1'].should eql("value1")
		test_hash['key2'].class.should eql(String)
		test_hash['key2'].should eql("value2")
	end

	it "#new nil" do
		crisis = Sigimera::Crisis.new nil
		crisis.no_method.should eql(nil)
		crisis['no_key'].should eql(nil)
	end

	it "#new 'some string'" do
		crisis = Sigimera::Crisis.new "some string"
		crisis.no_method.should eql(nil)
		crisis['no_key'].should eql(nil)
	end

	it "#new 23" do
		crisis = Sigimera::Crisis.new 23
		crisis.no_method.should eql(nil)
		crisis['no_key'].should eql(nil)
	end
	
end