require 'json'
module Moo
  module Model
    class BoundingBox
      attr_accessor :centre, :width, :height, :angle

      def initialize
        @centre = [0,0]
        @width, @height, @angle = 0, 0, 0
      end

      def to_json
        {
          :center => {
            :x => @centre[0],
            :y => @centre[1]
          },
          :width  => @width,
          :height => @height,
          :angle  => @angle
        }.to_json
      end

      def from_json(json)
        hash = JSON.parse(json, :symbolize_names => true)
        @centre = [hash[:center][:x], hash[:center][:y]]
        @width  = hash[:width]
        @height = hash[:height]
        @angle  = hash[:angle]
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
