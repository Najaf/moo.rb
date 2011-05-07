require 'moo/model/font'

module Moo
  module Model
    class TextData < Data
      attr_reader :font, :colour, :point_size, :alignment

      def font=value
        unless value.kind_of? Font
          raise ArgumentError, "expected Font, got '#{value.class}'"
        end
        @font = value
      end

      def colour=value
        unless value.kind_of? Colour
          raise ArgumentError, "expected Colour, got '#{value.class}'"
        end
        @colour = value
      end

      def point_size=value
        @point_size = value
        unless value.kind_of? Numeric
          raise ArgumentError, "expected Numeric, got '#{value.class}'"
        end
      end

      def alignment=value
        unless [:left, :right, :center].include? value.to_sym
          raise ArgumentError, "alignment must be one of :left, :right or :center"
        end
        @alignment = value
      end

    end
  end
end
