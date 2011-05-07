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
    end
  end
end
