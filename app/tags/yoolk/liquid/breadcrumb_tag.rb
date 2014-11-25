module Yoolk
  module Liquid
    class BreadcrumbTag < ::Liquid::Tag
      Syntax = /(#{::Liquid::QuotedString})/

      def initialize(tag_name, markup, options)
        super

        if markup.present?
          @class_name   = $1.gsub(/\"|\'/,'') if markup =~ Syntax
        end
      end

      def render(context)
        @context = context
        unless request.home_url?
          if request.map_url?              then list translate('map')
          elsif request.about_us_url?      then list translate('about_us')
          elsif request.brochures_url?     then list translate('brochures')
          elsif request.people_url?        then list translate('people')
          elsif request.reservation_url?   then list translate('reservation')
          elsif request.feedback_url?      then list translate('feedback')
          elsif request.contact_us_url?    then list translate('contact_us')
          elsif request.galleries_url?
            list view.link_to_if (@context['gallery']), translate('galleries'), request.galleries_path
            if gallery = @context['gallery']
              list gallery.name
            end
          elsif request.announcements_url?
            list view.link_to_if (@context['announcement']), translate('announcements'), request.announcements_path
            if announcement = @context['announcement']
              list announcement.id
            end
          elsif request.products_url?
            list view.link_to_if (@context['product_category'] || @context['product']), translate('products'), request.products_path
            if product_category = @context['product_category']
              list product_category.name
            end
            if product = @context['product']
              list view.link_to product.category.name, request.products_category_url(product.category)
              list product.name
            end
          elsif request.services_url?
            list view.link_to_if (@context['service_category'] || @context['service']), translate('services'), request.services_path
            if service_category = @context['service_category']
              list service_category.name
            end
            if service = @context['service']
              list view.link_to service.category.name, request.services_category_url(service.category)
              list service.name
            end
          else
            list view.link_to_if (@context['food_category'] || @context['food']), translate('menu'), request.menu_index_path
            if food_category = @context['food_category']
              list food_category.name
            end
            if food = @context['food']
              list view.link_to food.category.name, request.menu_category_url(food.category)
              list food.name
            end
          end

          # http://www.danshort.com/HTMLentities/
          %Q{
            <ol class="#{ @class_name || 'breadcrumb' }">
            #{list_home}
            #{@list_items}
            </ol>
          }
        end
      end

      def list_home
        view.content_tag :li do
          view.link_to translate('home'), view.root_path
        end
      end

      def list input
        @list_items ||= ''
        @list_items.concat view.content_tag(:li, input)
      end

      private

        def request
          @context['request']
        end

        def translate key
          I18n.t("#{request.theme_name}.breadcrumb.#{key}", default: I18n.t("breadcrumb.#{key}"))
        end

        def view
          @context.registers[:view]
        end

    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)