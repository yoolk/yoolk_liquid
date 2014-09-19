module Yoolk
  module Sandbox
    class Listing::People < Collection
      def directors
        select { |item| item.position_level.name.downcase == 'director' }
      end

      def managers
        select { |item| item.position_level.name.downcase == 'manager' }
      end

      def employees
        select { |item| item.position_level.name.downcase == 'employee' }
      end
    end
  end
end