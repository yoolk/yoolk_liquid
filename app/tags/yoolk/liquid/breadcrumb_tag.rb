module Yoolk
  module Liquid
    class BreadcrumbTag < ::Liquid::Tag

      Syntax = /\s*class\s*=\s*(#{::Liquid::QuotedString})/
      def initialize(tag_name, markup, options)
        super

        if markup.present?
          unless correct_syntax(markup)
            raise SyntaxError.new('Syntax Error - Valid syntax: {% breadcrumb [class="some-class"] %}')
          end
          @class_name   = $1 if markup =~ Syntax
        end
      end

      def correct_syntax markup
        /class\s*=/.match markup
      end

      def render(context)
        @context = context

        unless request.home_url?
          # list_items = list_home +
          if    request.map_url?           then list 'map'
          elsif request.about_us_url?      then list 'about_us'
          elsif request.brochures_url?     then list 'brochures'
          elsif request.people_url?        then list 'people'
          elsif request.reservation_url?   then list 'reservation'
          elsif request.feedback_url?      then list 'feedback'
          elsif request.contact_us_url?    then list 'contact_us'
          elsif request.galleries_url?
            list request.link_to_galleries 'galleries'
            if gallery = @context['listing.gallery']
              list gallery.name
            end
          elsif request.announcements_url?
            list link_to_announcements 'announcements'
            if @context['listing.announcement']
              list announcement.id
            end
          elsif @context['listing.products']
            list view.link_to('products', products_path)
            if product_category = @context['listing.product_category']
              list view.link_to product_category.name, request.services_category_url(product_category)
            end
            if product = @context['listing.product']
              list product.name
            end
          elsif @context['listing.services']
            list request.link_to_services 'services'
            if service_category = @context['listing.service_category']
              list view.link_to service_category.name, request.services_category_url(service_category)
            end
            if service = @context['listing.service']
              list service.name
            end
          else
            list view.link_to('menu', menu_index_path)
            if food_category = @context['listing.food_category']
              list view.link_to food_category.name, request.services_category_url(food_category)
            end
            if food = @context['listing.food']
              list food.name
            end
          end

          # http://www.danshort.com/HTMLentities/
          %Q{
            <ol class="#{ @class_name || 'breadcrumb' }">
            #{ list_items }
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
        binding.pry
        view.content_tag :li, input
      end

      private

        def request
          @context['request']
        end

        def translate key
          I18n::t "#{request.theme_name}.links.#{key}"
        end

        def view
          @context.registers[:view]
        end

    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)