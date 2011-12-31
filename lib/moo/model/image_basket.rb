module Moo
  module Model
    class ImageBasket
      attr_accessor :items

      def initialize
        yield self if block_given?
      end

      def to_hash
        hash = {
          :items => items.map {|i| i.to_hash }
        }
      end

      def to_json
        to_hash.to_json
      end
    end
  end
end
