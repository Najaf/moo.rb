module Moo
  module Model
    class ImageBasketItem
      class ImageItem
        attr_reader :resource_uri, :type, :width, :height, :rotation

        def initialize
          yield self if block_given?
        end

        def resource_uri=value
          value.complain_if_not_a String
          @resource_uri = value
        end

        def type=type
          unless [ "thumbnail", "print", "preview" ].include? type
            raise ArgumentError, "invalid type"
          end
          @type = type
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

        def rotation=value
          unless value.is_a? Numeric
            raise ArgumentError, "value must be Numeric, #{value.class} given"
          end
          @rotation = value
        end

        def to_hash
          hash = {
            :resourceUri => resource_uri,
            :type => type,
            :width => width,
            :height => height,
            :rotation => rotation
          }
        end

        def to_json
          to_hash.to_json
        end
      end

      attr_reader :resource_uri, :cache_id
      attr_accessor :items

      def initialize
        yield self if block_given?
      end

      def resource_uri=value
        value.complain_if_not_a String
        @resource_uri = value
      end

      def cache_id=value
        value.complain_if_not_a String
        @cache_id = value
      end

      def to_hash
        hash = {
          :resourceUri => resource_uri,
          :imageBox => nil,
          :removable => true,
          :croppable => true,
          :cacheId => cache_id,
          :imageItems => items.map {|i| i.to_hash }
        }
      end
    end
  end
end
