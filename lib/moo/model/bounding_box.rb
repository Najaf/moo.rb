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
        if value.is_a? Hash
          @centre = [value[:x], value[:y]]
        else
          @centre = value
        end
      end

      def width=value
        unless value.is_a? Numeric
          raise ArgumentError, "value must be Numeric, #{value.class} given"
        end
        @width = value
      end

      def height=value
        unless value.is_a? Numeric
          raise ArgumentError, "value must be Numeric, #{value.class} given"
        end
        @height = value
      end

      def angle=value
        unless value.is_a? Numeric
          raise ArgumentError, "value must be Numeric, #{value.class} given"
        end
        @angle = value
      end
    end
  end
end
