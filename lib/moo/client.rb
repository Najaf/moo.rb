require 'oauth'
module Moo
  class Client

    def self.oauth_secret=(secret)
      @@oauth_secret = secret
    end

    def self.oauth_key=(key)
      @@oauth_key = key
    end

    def self.config
      yield self if block_given?
    end


    attr_accessor :oauth_consumer, :oauth_key, :oauth_secret
    def initialize(params = nil)
      unless params.nil?
        @oauth_secret = params[:oauth_secret]
        @oauth_key    = params[:oauth_key]
      end

      yield self if block_given?

      ## set key/secret to default if not set
      @oauth_secret ||= @@oauth_secret
      @oauth_key    ||= @@oauth_key

      ## error if the oauth secret and key have not been set by now
      unless @oauth_secret && @oauth_key  
        raise "Moo Client requires OAuth key/secret to be set"
      end

      initialize_oauth_consumer
    end

    # get the initial request token
    #
    # clients can authorize this token and get the subsequent access token
    def get_request_token(callback_or_hash)
      callback = callback_or_hash.is_a?(String) ? callback_or_hash : callback_or_hash[:callback]
      @oauth_consumer.get_request_token(
        oauth_callback: callback
      )
    end

    def create_pack(access_token, product_code, pack_json)
      call_api(access_token, {
        method:   'moo.pack.createPack',
        product:  product_code.to_s,
        pack:     pack_json
      })
    end

    private
      def initialize_oauth_consumer
        @oauth_consumer = OAuth::Consumer.new(
          @oauth_key,
          @oauth_secret,
          {
            site:               "https://secure.moo.com",
            request_token_path: "/oauth/request_token.php",
            access_token_path:  "/oauth/access_token.php",
            authorize_path:     "/oauth/authorize.php" 
          }
        )
      end

      def call_api(access_token, params = {})
        access_token.post(
          '/api/service/',
          params,
          {
            'Content-Type' => 'application/json'
          }
        )
      end
  end
end
