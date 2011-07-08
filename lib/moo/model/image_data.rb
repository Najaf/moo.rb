module Moo
  module Model
    class ImageData < Data
      attr_reader :image_box, :resource_uri, :image_store_file_id, :enhance

      def initialize
        @enhance = false
      end

      def image_box=value
        value.complain_if_not_a BoundingBox
        @image_box = value
      end

      def resource_uri=value
        value.complain_if_not_a String
        @resource_uri = value
      end

      def image_store_file_id=value
        value.complain_if_not_a String
        @image_store_file_id = value
      end

      def enhance=value
        unless [true,false].include? value
          raise ArgumentError
        end
        @enhance = value
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        {
          type: type,
          linkId: link_id,
          imageBox: image_box.to_hash,
          resourceUri: resource_uri,
          imageStoreFileId: image_store_file_id,
          enhance: enhance
        }
      end

      def from_hash hash
        self.link_id = hash[:linkId]
        b = BoundingBox.new
        b.from_json(hash[:imageBox].to_json)
        self.image_box = b
        self.resource_uri = hash[:resourceUri]
        self.image_store_file_id = hash[:imageStoreFileId] if hash[:imageStoreFileId]
        self.enhance = hash[:enhance]
      end

      def from_json json
        from_hash(JSON.parse(json, :symbolize_names => true))
      end
    end
  end
end
