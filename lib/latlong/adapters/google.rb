require 'latlong/adapters/base'

module Latlong
  module Adapters
    class Google < Base

      def address
        "#{city(data.data)}, #{country_code(data.data)}"
      end

      def lat
        data.data['geometry']['location']['lat'].to_f
      end

      def lon
        data.data['geometry']['location']['lng'].to_f
      end

      def position
        if data.data['types'].include?('locality') && data.data['types'].include?('political')
          0
        else
          1
        end
      end

      private

      def city data
        data['address_components'].first['short_name']
      end

      def country_code data
        data['address_components'].last['short_name']
      end

    end
  end
end
