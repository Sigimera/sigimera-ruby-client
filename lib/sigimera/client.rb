require "json"
require "nokogiri"

module Sigimera
    # The main class that could be used to access the REST API
    class Client
        include Sigimera::HttpHelper

        # The authentication token that is used for the API calls.
        attr_reader :auth_token

        def initialize(auth_token = nil)
            @auth_token = auth_token
        end

        # This method returns current API version. For this purpose
        # the X-API-Version HTTP header is read out.
        #
        # @return [String] The first found version string of the API
        def self.get_api_version
            client = Sigimera::Client.new
            response = client.head("/public/crises")
            response.get_fields("X-API-Version").first.to_s if response.key?("X-API-Version")
        end

        # This method returns the latest 10 crises, but needs no
        # authentication token.
        #
        # @return [Array] Returns an array of crises objects in JSON
        def self.get_public_crises
            client = Sigimera::Client.new
            response = client.get("/public/crises")
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

        # This method returns the latest 10 crises.
        #
        # @param [String] type The crises type, e.g. earthquake, flood, cyclone, volcanoe
        # @return [Array] Returns an array of crises objects in JSON
        def get_latest_crises(type = nil)
            endpoint = "/v1/crises?auth_token=#{@auth_token}"
            endpoint += "&type=#{type}" if type
            response = self.get(endpoint)
            JSON.parse response.body if response
        end
    end
end
