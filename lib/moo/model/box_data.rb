require 'json'
module Moo
  module Model
    class BoxData < Data
      attr_reader :colour

      def colour=(value)
        unless value.kind_of? Colour
          raise ArgumentError, "expected Colour, got '#{value.class}'"
        end
        @colour = value
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        {
            :linkId => link_id,
            :type => 'boxData',
            :colour => colour.to_hash
        }
      end

      def from_json json
        hash = JSON.parse json, :symbolize_names => true
        @link_id = hash[:linkId]
        @colour = Colour.new
        @colour.from_json(hash[:colour].to_json)
      end
    end
  end
end
