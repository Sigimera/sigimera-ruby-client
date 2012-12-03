# encoding: UTF-8
#
# This library encapsulates the Sigimera REST API access. For more information
# about the API see http://api.sigimera.org
#
# Author::      Alex Oberhauser (mailto:alex.oberhauser@sigimera.org)
# Copyright::   Copyright (c) 2012 Sigimera
# License::     MIT
module Sigimera
	# The Sigimera REST API Host
	unless "development".eql? ENV['SIGIMERA_ENV']
		API_HOST 	= "https://api.sigimera.org"
	else
		API_HOST 	= "http://localhost:9292"
	end

	# The used SSL certificate for the HTTPS connection
	CACERT_FILE	= File.expand_path("../../certs/cacert.crt", __FILE__)
end

require "sigimera/version"
require "sigimera/http_helper"
require "sigimera/client"

require "sigimera/data/crisis"
