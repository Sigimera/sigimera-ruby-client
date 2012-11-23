module Sigimera
    # The main class that could be used to access the REST API
    class Client
        include Sigimera::HttpHelper

        # The authentication token that is used for the API calls.
        attr_reader :auth_token

        def initialize(auth_token = nil)
            @auth_token = auth_token
        end

        def get_latest_crises
            get("/v1/crises?auth_token=#{@auth_token}")
        end
    end
end
