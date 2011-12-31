require 'moo/model/template'
module Moo
  module Model
    class Side
      attr_accessor :template, :data, :type, :pack, :side_num

      def initialize
        @data = []
        yield self if block_given?
      end

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

      # wrapper that sets template object 
      def template_code=code
        unless Template.codes.include? code
          raise ArgumentError, "invalid templatecode"
        end
        @template = Template.with_code code
      end

      def template_code
        return nil if @template.nil?
        @template.code
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        hash = {
          sideNum:  side_num,
          templateCode:  template_code,
          type: type,
          data: data.map { |d| d.to_hash }
        }
      end

      def from_json json
        from_hash(JSON.parse(json, :symbolize_names => true))
      end

      def from_hash hash
        self.side_num = hash[:sideNum]
        self.template_code = hash[:templateCode]
        self.type = hash[:type]
        self.data = hash[:data].map {|d| data_from_hash  d }
      end

      def data_from_hash(hash)
        klass = hash[:type].gsub(/\b\w/){|s|s.upcase} 
        data = eval(klass).new
        data.from_hash hash
        data
      end

    end
  end
end
