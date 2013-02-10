module Moo
  module Model
    class ImageBasket
      attr_accessor :items

      def self.from_hash(hash)
        new.from_hash(hash)
      end

      def initialize
        @items = []
        yield self if block_given?
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        hash = {
          :items => items.map {|i| i.to_hash }
        }
      end

      def from_hash(hash)
        @items = hash[:items].map { |h| ImageBasketItem.from_hash(h) }
        self
      end
    end
  end
end
