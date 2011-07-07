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
        {
            :linkId => link_id,
            :type => 'boxData',
            :colour => colour.to_hash
        }.to_json
      end
    end
  end
end
