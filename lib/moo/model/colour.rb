module Moo
  module Model
    class Colour
      attr_accessor :type, :c, :m, :y, :k, :r, :g, :b

      def type=new_type
        unless ['cmyk','rgb','CMYK','RGB'].include? new_type
          raise ArgumentError, 
            "type must be either 'cmyk' or 'rgb', '#{new_type}' given"
        end
        @type = new_type.upcase
      end

      def c=value
        validate_numeric 'c', value, 0, 100.0
        @c = value
      end

      def m=value
        validate_numeric 'm', value, 0, 100.0
        @m = value
      end

      def y=value
        validate_numeric 'y', value, 0, 100.0
        @y = value
      end

      def k=value
        validate_numeric 'k', value, 0, 100.0
        @k = value
      end

      def r=value
        validate_numeric 'r', value, 0, 255
        @r = value
      end

      def g=value
        validate_numeric 'g', value, 0, 255
        @g = value
      end

      def b=value
        validate_numeric 'b', value, 0, 255
        @b = value
      end

      private
        def validate_numeric field, value, from = -1000, to = 1000
          unless value.is_a? Numeric
            raise ArgumentError, "tried to set #{field} to non-numeric value"
          end 
          unless from <= value and value <= to
            raise ArgumentError, "value #{value.to_s} out of range, must be between #{from.to_s} and #{to.to_s} inclusive"
          end
        end

    end
  end
end
