module Yoolk
  module Liquid
    class RequestDrop < BaseDrop
      def initialize
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
        @context.registers[:controller].params[:theme]
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
        "#{ controller.controller_path.split('/')[0].gsub('_', '-') }-#{ action_name }"
      end

      def query_parameters
        request.query_parameters
      end

      private

        def action_name
          controller.action_name
        end
    end
  end
end