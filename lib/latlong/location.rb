require 'geocoder'
require 'latlong/adapters'

module Latlong
  class Location
    attr_reader :term, :adapter

    def initialize term
      @term = term
    end

    def results
      @results ||= get_results
    end

    private

    def get_results
      search.map do |location|
        adapter.parse location
      end
    end

    def adapter
      case Latlong.configuration.provider
      when :yandex then Adapters::Yandex
      when :google then Adapters::Google
      end
    end

    def search
      Geocoder.search(term)
    end

  end
end
