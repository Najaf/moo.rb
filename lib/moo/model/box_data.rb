module Moo
  module Model
    class BoxData < Data
      attr_reader :colour

      def colour=(value)
        unless value.kind_of? Colour
          raise ArgumentError, "expected Colour, got '#{value.class}'"
        end
        @colour = value
      end
    end
  end
end
