require 'oauth'
require 'net/http/post/multipart'
module Moo
  class Client
    attr_accessor :oauth_consumer, 
      :oauth_consumer_key, 
      :oauth_consumer_secret,
      :oauth_access_token

    def self.oauth_consumer_secret=(secret)
      @@oauth_consumer_secret = secret
    end

    def self.oauth_consumer_key=(key)
      @@oauth_consumer_key = key
    end

    def self.config
      yield self if block_given?
    end

    def initialize(options={})
      @oauth_consumer_secret = options[:oauth_consumer_secret]
      @oauth_consumer_key = options[:oauth_consumer_key]

      yield self if block_given?

      # set key/secret to default if not set
      @oauth_consumer_secret ||= @@oauth_consumer_secret
      @oauth_consumer_key ||= @@oauth_consumer_key

      # error if the oauth secret and key have not been set by now
      unless @oauth_consumer_secret and @oauth_consumer_key
        raise "Moo Client requires OAuth consumer key/secret"
      end

      # create the consumer
      @oauth_consumer ||= OAuth::Consumer.new(
        @oauth_consumer_key,
        @oauth_consumer_secret, {
          site: "https://secure.moo.com",
          request_token_path: "/oauth/request_token.php",
          access_token_path: "/oauth/access_token.php",
          authorize_path: "/oauth/authorize.php" 
        })

      # create the access token
      if options[:oauth_access_token] and options[:oauth_access_token_secret]
        @oauth_access_token ||= OAuth::AccessToken.new(
          @oauth_consumer,
          options[:oauth_access_token],
          options[:oauth_access_token_secret])
      end
    end

    def get_request_token(options)
      @oauth_consumer.get_request_token(oauth_callback: options[:callback])
    end

    def create_pack(pack)
      call({
        method: "moo.pack.createPack",
        product: pack.product_code.to_s,
        pack: pack.to_json
      })
    end
    
    def update_pack(pack_id, pack)
      call({
        method: "moo.pack.updatePack",
        packId: pack_id,
        pack: pack.to_json
      })
    end

    def upload_image(path)
      options = {
        method: "moo.image.uploadImage",
        imageFile: UploadIO.new(path, "image/jpeg", "image.jpg")
      }
      File.open(path) do
        request = Net::HTTP::Post::Multipart.new("/api/service/", options)
        http = Net::HTTP.new("secure.moo.com", 443)
        http.use_ssl = true
        response = http.start do |net|
          net.request(request)
        end
        JSON.parse(response.body)
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
        response = oauth_access_token.post(
          "/api/service/", params, { "Content-Type" => "application/json" })
        JSON.parse(response.body)
      end
  end
end
