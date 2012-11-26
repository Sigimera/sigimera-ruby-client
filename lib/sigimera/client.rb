# encoding: UTF-8
require "json"
require "nokogiri"
require "base64"

module Sigimera
    # The main class that could be used to access the REST API
    class Client
        include Sigimera::HttpHelper

        def initialize(auth_token = nil, username = nil, password = nil)
            @auth_token = auth_token if auth_token
            @auth_token = self.get_auth_token(username, password) if username and password
        end

        # This method returns current API version. For this purpose
        # the X-API-Version HTTP header is read out.
        #
        # @return [String] The first found version string of the API
        def self.get_api_version
            client = Sigimera::Client.new
            response = client.head("/public/crises.json")
            response.get_fields("X-API-Version").first.to_s if response.key?("X-API-Version")
        end

        # This method returns the latest 10 crises, but needs no
        # authentication token.
        #
        # @return [Array] Returns an array of crises objects in JSON
        def self.get_public_crises
            client = Sigimera::Client.new
            response = client.get("/public/crises.json")
            JSON.parse response.body if response
        end

        # This method returns the latest 10 crises as RSS feed,
        # but needs no authentication token.
        #
        # @return [Nokogiri::XML::Document] Returns an a nokogiri xml document
        def self.get_public_rss_feed
            client = Sigimera::Client.new
            response = client.get("/public/crises.rss")
            Nokogiri::XML(response.body) if response
        end


        # This method returns an authentication token. If the auth_token
        # exists it is returned, otherwise a new one is created.
        #
        # @param [String] username The username (email) that is used for the basic authentication
        # @param [String] password The password that is used for the basic authentication
        # @return [String] The authentication token as string
        def self.get_auth_token(username, password)
            basic_hash = Base64.strict_encode64("#{username}:#{password}")
            client = Sigimera::Client.new
            response = client.post("/v1/tokens.json", basic_hash)
            json = JSON.parse response.body if response
            json['auth_token'].to_s if json
        end

        # This method returns the latest 10 crises.
        #
        # @param [String] type The crises type, e.g. earthquake, flood, cyclone, volcanoe
        # @return [Array] Returns an array of crises objects in JSON
        def get_latest_crises(type = nil)
            endpoint = "/v1/crises.json?auth_token=#{@auth_token}"
            endpoint += "&type=#{type}" if type
            response = self.get(endpoint)
            JSON.parse response.body if response
        end

        # This method returns statistic information about the crises.
        #
        # @return [Array] Returns the crises statistic as JSON object
        def get_crises_stat
            response = self.get("/v1/stats/crises.json?auth_token=#{@auth_token}")
            JSON.parse response.body if response
        end

        # This method returns statistic information about user.
        #
        # @return [Array] Returns the user statistic as JSON object
        def get_user_stat
            response = self.get("/v1/stats/users.json?auth_token=#{@auth_token}")
            JSON.parse response.body if response
        end

        private
        # The authentication token that is used for the API calls.
        attr_reader :auth_token

    end
end
