module Moo
  module Model
    class Pack
      attr_accessor :cards, :sides, :product_code

      PRODUCT_CODES = ['businesscard', 'minicard', 'postcard', 'holidaycard', 'sticker'].freeze

      def initialize
        @cards = []
        @sides = []
      end

      def product_code=code
        unless PRODUCT_CODES.include? code
          raise(ArgumentError, 
            "Invalid product code '#{code}', must be one of [#{PRODUCT_CODES.join(', ')}]"
          )
        end
        @product_code = code
      end
    end
  end
end
