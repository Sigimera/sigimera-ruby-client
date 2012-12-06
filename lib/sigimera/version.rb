# encoding: UTF-8
module Sigimera
    # Module that encapsulates the version number.
    module VERSION
        # The major version number that changes only if incompatibility with
        # the previous version was introduced.
        MAJOR = 0

        # The minor version number indicates that new features were added.
        MINOR = 1

        # The tiny number stands for bug fixes.
        TINY  = 0

        # The extra string marks the version as beta, alpha, rcX, ...
        EXTRA = nil

        # Concatenates the version to a point separated string
        STRING = [MAJOR, MINOR, TINY].join('.')
        STRING << ".#{EXTRA}" if EXTRA

        ##
        # @return [String]
        def self.to_s()
            STRING
        end

        ##
        # @return [String]
        def self.to_str()
            STRING
        end
        ##
        # @return [Array(Integer, Integer, Integer)]
        def self.to_a()
            [MAJOR, MINOR, TINY]
        end
    end
end
