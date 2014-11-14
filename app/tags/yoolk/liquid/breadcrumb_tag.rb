module Yoolk
  module Liquid
    class BreadcrumbTag < ::Liquid::Tag

      Syntax = /(#{::Liquid::QuotedString})\s*class_active\s*=\s*(#{::Liquid::QuotedString})/

      def initialize(tag_name, markup, options)
        super

        if markup =~ Syntax
          @class_name   = 'breadcrumb'
          @separator    = $1
          @class_active = $2
        else
          raise SyntaxError.new('Syntax Error - Valid syntax: {% breadcrumb separator="&raquo;" class_active="active" %}')
        end
      end

      def render(context)
        @context = context
        unless home_page?
          list_item = if map_page?  then list translate 'map'
          elsif about_us_page?      then list translate 'about_us'
          elsif brochures_page?     then list translate 'brochures'
          elsif people_page?        then list translate 'people'
          elsif reservation_page?   then list translate 'reservation'
          elsif feedback_page?      then list translate 'feedback'
          elsif contact_us_page?    then list translate 'contact_us'
          end

          %Q{
            <ol class="#{ @class_name }">
            #{ list_item }
            </ol>
          }
        end
      end

      def list( text, url = "" )
        home_path = view.content_tag :li do
          view.link_to translate('home'), view.root_path
        end

        home_path.concat view.content_tag :li, text
      end

      def translate key
        I18n::t "#{request.params[:theme]}.links.#{key}"
      end

      def request
        @context.registers[:controller].request
      end

      def view
        @context.registers[:view]
      end

      private

        def home_page?
          request.fullpath == view.root_path
        end

        def map_page?
          request.fullpath.start_with?(view.map_index_path.split('?')[0])
        end

        def about_us_page?
          request.fullpath.start_with?(view.about_us_path.split('?')[0])
        end

        def brochures_page?
          request.fullpath.start_with?(view.brochures_path.split('?')[0])
        end

        def people_page?
          request.fullpath.start_with?(view.people_path.split('?')[0])
        end

        def reservation_page?
          request.fullpath.start_with?(view.reservation_index_path.split('?')[0])
        end

        def feedback_page?
          request.fullpath.start_with?(view.feedback_index_path.split('?')[0])
        end

        def contact_us_page?
          request.fullpath.start_with?(view.contact_us_path.split('?')[0])
        end

    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)