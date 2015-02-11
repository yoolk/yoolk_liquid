module Yoolk
  module Liquid
    class RequestDrop < BaseDrop
      def initialize
      end

      def home_url
        root_path
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

      def links_url
        links_path
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

      def attachments_url
        attachments_path
      end

      def videos_url
        videos_path
      end

      def host
        request.host.gsub(/^www\./, '')
      end

      def preview_mode?
        host.in?(['iw.yoolk.com', 'iwstaging.yoolk.com', 'localhost']) && request.params[:alias_id].present?
      end

      def previewed_template
        if preview_mode? && @context['current_template'].present?
          @context['current_template']
        end
      end

      def theme_name
        request.params[:theme]
      end

      # theme_style_url is deprecated due to the rename to color
      def theme_style_url
        theme_color_url
      end

      def theme_color_url
        controller.theme_color_url
      end

      # style_name is deprecated due to the rename to color
      def style_name
        theme_color
      end

      def theme_color
        request.params[:color]
      end

      def js_class_name
        action = case action_name
          when 'create' then 'New'
          when 'update' then 'Edit'
          else action_name
        end.camelize

       "Views.#{controller.class.name.gsub('::', '.').gsub(/Controller$/, '')}.#{action.camelize}View"
      end

      def css_class_name
        controller.controller_path.split('/')[0].gsub('_', '-')
      end

      private

        def action_name
          controller.action_name
        end
    end
  end
end