module Moo
  module Model
    class Data
      attr_accessor :link_id

      def type
        self.class.name.split('::')[2].uncapitalize
      end
    end
  end
end
