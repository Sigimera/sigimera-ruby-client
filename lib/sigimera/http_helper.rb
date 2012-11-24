require "net/http"

module Sigimera
    # Encapsulates the low level HTTP(S) calls.
    module HttpHelper

        # GET endpoint
        #
        # @param [String] endpoint The endpoint that should be called.
        # @return [Net::HTTPResponse] The HTTP response object
        def get(endpoint)
            uri, http = get_connection(endpoint)

            req = Net::HTTP::Get.new("#{uri.path}?#{uri.query}")
            req.add_field("Content-Type", "application/json")
            req.add_field("User-Agent", "Sigimera Ruby Client v#{Sigimera::VERSION}")

            http.request(req)
        end

        # HEAD endpoint
        #
        # @param [String] endpoint The endpoint that should be called.
        # @return [Net::HTTPResponse] The HTTP response object
        def head(endpoint)
            uri, http = get_connection(endpoint)

            req = Net::HTTP::Head.new("#{uri.path}?#{uri.query}")
            req.add_field("User-Agent", "Sigimera Ruby Client v#{Sigimera::VERSION}")

            http.request(req)
        end

        private

        # @param [String] endpoint The endpoint that should be called.
        # @return [Array] First is the URI and second the HTTP object.
        def get_connection(endpoint)
            uri = URI(API_HOST + endpoint)

            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = (uri.scheme == 'https')
            if (File.file?(CACERT_FILE) && http.use_ssl?)
                http.ca_file = CACERT_FILE
                http.verify_mode = OpenSSL::SSL::VERIFY_PEER
                http.verify_depth = 5
            else
                raise "Please use a secure SSL connection and the right root certificate. If you experience problems please contact support@sigimera.org."
            end

            return uri, http
        end
    end
end
