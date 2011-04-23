require 'moo'
module Moo
  module Model
    class Side
      attr_accessor :template_code, :data, :type, :pack

      def type=new_type
        unless ['image', 'details'].include? new_type
          raise ArgumentError, "type must be either 'image' or 'details'"
        end
        @type = new_type
      end

      def pack=new_pack
        unless new_pack.is_a? Pack
          raise ArgumentError, "pack must be of type Pack, #{new_pack.class} given"
        end
        @pack = pack
      end
    end
  end
end
