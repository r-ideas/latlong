require 'ostruct'

module Latlong
  module Adapters
    class Base

      class NotImplemented < StandardError; end

      attr_reader :data

      def self.parse data
        parsed = new(data)
        OpenStruct.new(address:  parsed.address,
                       lat:      parsed.lat,
                       lon:      parsed.lon,
                       position: parsed.position)
      end

      def initialize data
        @data = data
      end

      %w(address lat lon position).each do |method|
        define_method(method) { raise NotImplemented.new  }
      end

    end
  end
end
