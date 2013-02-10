module Moo
  module Model
    class BoxData < Data
      attr_reader :colour

      def self.from_hash(hash)
        new.from_hash(hash)
      end

      def initialize
        yield self if block_given?
      end

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
        hash = {
          :type => 'boxData',
          :linkId => link_id,
          :colour => colour.to_hash
        }
      end

      def from_hash(hash)
        @link_id = hash[:linkId]
        @colour = Colour.from_hash(hash[:colour])
        self
      end
    end
  end
end
