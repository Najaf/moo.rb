module Moo
  module Model
    class Side
      attr_accessor :template_code, :data, :type

      def type=new_type
        unless ['image', 'details'].include? new_type
          raise ArgumentError, "type must be either 'image' or 'details'"
        end
        @type = new_type
      end
    end
  end
end
