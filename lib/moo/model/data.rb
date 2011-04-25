module Moo
  module Model
    class Data
      def type
        self.class.uncapitalize
      end
    end
  end
end
