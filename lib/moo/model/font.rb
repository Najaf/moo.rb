require 'json'
module Moo
  module Model
    class Font
      attr_accessor :family, :bold, :italic

      ACCEPTED_FAMILIES = [
        'arial',
        'avantgarde',
        'bryant',
        'courier',
        'frutigerltpro',
        'georgia',
        'helv',
        'helvetica',
        'index',
        'meta',
        'officina',
        'radio',
        'router',
        'vagrounded'
      ]

      @@default_family = 'helvetica'

      def initialize
        @family = @@default_family
        @bold = false
        @italic = false
        yield self if block_given?
      end

      alias_method :bold?,   :bold
      alias_method :italic?, :italic

      def family=value
        unless value.is_a? String
          raise ArgumentError, "value must be a String, #{value.class} given"
        end
        unless ACCEPTED_FAMILIES.include? value
          raise ArgumentError, "font family must be on of accepted list, '#{value}' given"
        end
        @family = value
      end

      def to_json
        to_hash.to_json
      end

      def to_hash
        {
          :fontFamily => @family,
          :bold       => @bold,
          :italic     => @italic
        }
      end

      def from_json(json)
        hash = JSON.parse(json, :symbolize_names => true)
        @family = hash[:fontFamily]
        @bold   = hash[:bold]
        @italic = hash[:italic]
      end
    end
  end
end
