require "json"

module Sigimera
    # The main class that could be used to access the REST API
    class Client
        include Sigimera::HttpHelper

        # The authentication token that is used for the API calls.
        attr_reader :auth_token

        def initialize(auth_token = nil)
            @auth_token = auth_token
        end

        # This method returns the latest 10 crises.
        #
        # @return [Array] Returns an array of crises objects in JSON
        def get_latest_crises
            response = get("/v1/crises?auth_token=#{@auth_token}")
            JSON.parse response.body if response
        end
    end
end
