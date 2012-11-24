module Sigimera
    # Part of the Sigimera Platform
    #
    # Author::      Alex Oberhauser (mailto:alex.oberhauser@sigimera.org)
    # Copyright::   Copyright (c) 2012 Sigimera
    # License::     Closed Source
    module VERSION
        # The major version number that changes only if incompatibility with
        # the previous version was introduced.
        MAJOR = 0

        # The minor version number indicates that new features were added.
        MINOR = 0

        # The tiny number stands for bug fixes.
        TINY  = 1

        # The extra string marks the version as beta, alpha, rcX, ...
        EXTRA = "rc2"

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
