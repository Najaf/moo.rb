module Moo
  module Model
    class BoundingBox
      attr_accessor :centre, :width, :height, :angle

      def initialize
        @centre = [0,0]
        @width, @height, @angle = 0, 0, 0
      end

      def centre=value
        unless value.is_a? Enumerable
          raise ArgumentError, "value must be Enumerable, #{value.class} given"
        end
        @centre = value
      end
    end
  end
end
