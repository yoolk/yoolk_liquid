module Yoolk
  module Liquid

    class BreadcrumbTag < ::Liquid::Tag

      Syntax_class = /\s*class\s*=\s*(#{::Liquid::QuotedString})/
      Syntax_sep   = /\s*sep\s*=\s*(#{::Liquid::QuotedString})/

      def initialize(tag_name, markup, options)
        super

        if markup.present?

          unless correct_syntax(markup)
            raise SyntaxError.new('Syntax Error - Valid syntax: {% breadcrumb class="some-class" sep="&raquo;" %}')
          end

          @class_name   = $1 if markup =~ Syntax_class
          @separator    = $1 if markup =~ Syntax_sep
        end

      end

      def correct_syntax markup
        true
      end

      def render(context)
        @context = context

        unless request.home_page?
          list_items = if request.map_page? then list item('map')
          elsif request.about_us_page?      then list item('about_us')
          elsif request.brochures_page?     then list item('brochures')
          elsif request.people_page?        then list item('people')
          elsif request.reservation_page?   then list item('reservation')
          elsif request.feedback_page?      then list item('feedback')
          elsif request.contact_us_page?    then list item('contact_us')
          else
            if collection.category?
              list collection.category.name

              if collection.category.item_detail?
                unless request.announcements_page? or request.galleries_page?
                  list collection.category.item_detail
                else
                  list collection.category.name
                end
              else
                list collection.category.name
              end
            else
              list view.content_tag :li, collection.name
            end
          end

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
        list_home.concat input
      end

      def item text
        view.content_tag :li, translate(text)
      end

      private

        def collection
          ::Yoolk::Liquid::RequestCollectionDrop.new @context
        end

        def controller
          @context.registers[:controller]
        end

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