require 'oauth'
require 'net/http/post/multipart'
module Moo
  class Client
    attr_accessor :oauth_consumer, :oauth_access_token

    def initialize(oauth_consumer_key, oauth_consumer_secret)
      # create the consumer
      @oauth_consumer = OAuth::Consumer.new(
        oauth_consumer_key,
        oauth_consumer_secret, {
          site: "https://secure.moo.com"
        })

      # create the access token
      @oauth_access_token = OAuth::AccessToken.new(@oauth_consumer)
    end

    def create_pack(pack, tracking_id=nil)
      params = {
        method: "moo.pack.createPack",
        product: pack.product_code.to_s,
        pack: pack.to_json
      }
      params[:trackingId] = tracking_id if tracking_id
      call(params)
    end

    def update_pack(pack_id, pack)
      call({
        method: "moo.pack.updatePack",
        packId: pack_id,
        pack: pack.to_json
      })
    end

    def upload_image(path)
      File.open(path) do |image|
        params = {
          method: "moo.image.uploadImage",
          imageFile: UploadIO.new(image, "image/jpeg", "image.jpg")
        }
        request = Net::HTTP::Post::Multipart.new("/api/service/", params)
        http = Net::HTTP.new("www.moo.com", 80)
        response = http.start {|net| net.request(request) }
        handle_response(response)
      end
    end

    def import_image(image_url)
      call({
        method: "moo.image.importImage",
        imageUrl: image_url
      })
    end

    private
      def call(params={})
        handle_response(oauth_access_token.post(
          "/api/service/", params, { "Content-Type" => "application/json" }))
      end

      def handle_response(response)
        case response.code.to_i
        when 200
          JSON.parse(response.body)
        else
          raise RuntimeError, response.body
        end
      end
  end
end
