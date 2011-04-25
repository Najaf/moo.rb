module Moo
  module Model
    class Data
      def type
        self.class.name.split('::')[2].uncapitalize
      end
    end
  end
end
