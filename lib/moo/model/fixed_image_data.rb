module Moo
  module Model
    class FixedImageData < Data
      attr_reader :resource_uri

      def self.from_hash(hash)
        new.from_hash(hash)
      end

      def initialize
        yield self if block_given?
      end

      def resource_uri=value
        unless value.is_a? String
          raise ArgumentError, "expected String, got a #{value.class}"
        end
        @resource_uri = value
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        hash = {
          :type => type,
          :linkId => link_id
        }
        hash[:resourceUri] = resource_uri unless resource_uri.nil?
        hash
      end

      def from_hash(hash)
        self.link_id = hash[:linkId]
        self.resource_uri = hash[:resourceUri]
        self
      end
    end
  end
end
