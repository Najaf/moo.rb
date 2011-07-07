require 'json'
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

      def to_json
        self.to_hash.to_json
      end

      def to_hash
        if @type == 'RGB'
          return {
            :type => 'RGB',
            :r    => @r,
            :g    => @g,
            :b    => @b
          }
        elsif @type == 'CMYK'
          return {
            :type => 'CMYK',
            :c    => @c,
            :m    => @m,
            :y    => @y,
            :k    => @k
          }
        end
      end

      def from_json json
        hash = JSON.parse json, :symbolize_names => true
        keys = [:type]
        if hash[:type] == 'RGB'
          keys << :r << :g << :b
        elsif hash[:type] == 'CMYK'
          keys << :c << :m << :y << :k
        end
        keys.each { |k| send (k.to_s + '=').to_sym, hash[k] }
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
