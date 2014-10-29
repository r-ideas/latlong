require 'latlong/adapters/base'

module Latlong
  module Adapters
    class Yandex < Base

      def lat
        coordinates(data).last
      end

      def lon
        coordinates(data).first
      end

      def address
        "#{city(data.data)}, #{country_code(data.data)}"
      end

      def position; 0; end

      private

      def city data
        data['GeoObject']['name']
      end

      def country_code data
        data['GeoObject']['metaDataProperty']['GeocoderMetaData']['AddressDetails']['Country']['CountryNameCode']
      end

      def coordinates data
        data.data['GeoObject']['Point']['pos'].split(' ').map(&:to_f)
      end

    end
  end
end
