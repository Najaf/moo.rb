module Moo
  module Model
    class Card
      # image and details side
      attr_accessor :image_side, :details_side

      def initialize
        yield self if block_given?
      end
    end
  end
end
