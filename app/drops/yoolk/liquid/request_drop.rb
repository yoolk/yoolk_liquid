module Yoolk
  module Liquid
    class RequestDrop < BaseDrop
      def initialize
      end

      def root_url
        root_path
      end

      def office_url
        office_path
      end

      def map_url
        map_index_path
      end

      def menu_url
        menu_index_path
      end

      def reservation_url
        reservation_index_path
      end

      def feedback_url
        feedback_index_path
      end

      def galleries_url
        galleries_path
      end

      def people_url
        people_path
      end

      def brochures_url
        brochures_path
      end

      def products_url
        products_path
      end

      def services_url
        services_path
      end

      def announcements_url
        announcements_path
      end

      def about_us_url
        about_us_path
      end

      def contact_us_url
        contact_us_path
      end

      def host
        request.host.gsub(/^www\./, '')
      end

      def preview_mode?
        host.in?(['iw.yoolk.com', 'iwstaging.yoolk.com', 'localhost']) && request.params[:alias_id].present?
      end

      def theme_name
        request.params[:theme]
      end

      def theme_style_url
        controller.theme_style_url
      end

      def style_name
        request.params[:style]
      end
    end
  end
end