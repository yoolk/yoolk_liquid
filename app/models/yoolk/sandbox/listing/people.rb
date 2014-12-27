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

      def actives
        self.class.new select { |item| item.is_active }
      end

      def publics
        self.class.new select { |item| item.sharing_status.to_s.downcase == 'public' }
      end
    end
  end
end