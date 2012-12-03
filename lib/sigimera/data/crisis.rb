# encoding: UTF-8
#
# This library encapsulates the Sigimera REST API access. For more information
# about the API see http://api.sigimera.org
#
# Author::      Alex Oberhauser (mailto:alex.oberhauser@sigimera.org)
# Copyright::   Copyright (c) 2012 Sigimera
# License::     MIT
module Sigimera
	# This class encapsulates the access to crisis JSON objects. 
	# Additional it simulates the access syntax of JSON objects.
	# For future use this class can implemente different type of checks.
	class Crisis

		def initialize json_object
			@crisis = json_object
		end

		# Simulates the same access as for JSON objects
		def [](key)
			@crisis[key.to_s] if @crisis and @crisis.class.eql?(Hash)
		end

		# Provides for each key a instance method
		def method_missing(method)
			@crisis[method.to_s] if @crisis and @crisis.class.eql?(Hash) and @crisis.key?(method.to_s)
		end

	end
end