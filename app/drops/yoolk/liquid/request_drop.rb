module Yoolk
  module Liquid
    class RequestDrop < BaseDrop
      def initialize
      end

      def map_path
        map_index_path
      end

      def menu_path
        menu_index_path
      end

      def reservation_path
        reservation_index_path
      end

      def feedback_path
        feedback_index_path
      end
    end
  end
end