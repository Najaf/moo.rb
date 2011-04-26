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

    end
  end
end
