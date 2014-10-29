module Latlong
  class Configuration
    class RedisNotFoundError < StandardError; end

    attr_accessor :provider, :cache

    def initialize
      @provider = :google
      @cache    = false
    end

    def provider=(name)
      @provider = name
      set_lookup!
    end

    def cache=(val)
      @cache = val
      set_cache!
    end

    private

    def set_lookup!
      Geocoder::Configuration.lookup = provider
    end

    def set_cache!
      if cache
        begin
          require 'redis'
          Geocoder::Configuration.cache = Redis.new
        rescue LoadError
          raise RedisNotFoundError.new
        end
      else
        Geocoder::Configuration.cache = false
      end
    end

  end
end
