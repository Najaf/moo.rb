require 'moo/model/font'

module Moo
  module Model
    class TextData < Data
      attr_reader :font, :colour, :point_size, :alignment
      attr_accessor :text

      def font=value
        unless value.kind_of? Font
          raise ArgumentError, "expected Font, got '#{value.class}'"
        end
        @font = value
      end

      def colour=value
        unless value.kind_of? Colour
          raise ArgumentError, "expected Colour, got '#{value.class}'"
        end
        @colour = value
      end

      def point_size=value
        @point_size = value
        unless value.kind_of? Numeric
          raise ArgumentError, "expected Numeric, got '#{value.class}'"
        end
      end

      def alignment=value
        unless [:left, :right, :center].include? value.to_sym
          raise ArgumentError, "alignment must be one of :left, :right or :center"
        end
        @alignment = value.to_sym
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        {
          :type => type,
          :linkId => link_id,
          :pointSize => point_size,
          :alignment => alignment,
          :font => font.to_hash,
          :colour => colour.to_hash
        }
      end

      def from_json json
        hash = JSON.parse(json, :symbolize_names => true)
        self.link_id =  hash[:linkId]
        self.point_size = hash[:pointSize]
        self.alignment = hash[:alignment].to_sym
        self.font = Font.new
        self.font.from_json(hash[:font].to_json)
        self.colour = Colour.new
        self.colour.from_json(hash[:colour].to_json)
      end

    end
  end
end
