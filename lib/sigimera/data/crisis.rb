# encoding: UTF-8
#
# This library encapsulates the Sigimera REST API access. For more information
# about the API see http://api.sigimera.org
#
# Author::      Alex Oberhauser (mailto:alex.oberhauser@sigimera.org)
# Copyright::   Copyright (c) 2012 Sigimera
# License::     MIT
module Sigimera
	class Crisis

		def initialize json_object
			@crisis = json_object
		end

		def [](key)
			@crisis[key.to_s]
		end

		def method_missing(method)
			@crisis[method.to_s] if @crisis.key?(method.to_s)
		end

	end
end