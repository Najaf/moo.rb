module Moo
  module Model
    class BoundingBox
      attr_accessor :centre, :width, :height, :angle

      def initialize
        @centre = [0,0]
        @width, @height, @angle = 0, 0, 0
      end

      def centre=value
        unless value.is_a? Array or value.is_a? Hash
          raise ArgumentError, "value must be a hash or an array, #{value.class} given"
        end
        @centre = value
      end
    end
  end
end
