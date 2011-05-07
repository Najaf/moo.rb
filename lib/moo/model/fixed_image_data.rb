module Moo
  module Model
    class FixedImageData < Data
      attr_reader :resource_uri
    end

    def resource_uri=value
      unless value.is_a? String
        raise ArgumentError, "expected String, got a #{value.class}"
      end
      @resource_uri = value 
    end
  end
end
