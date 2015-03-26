module Yoolk
  module Liquid
    class InstantWebsite::PageDrop < BaseDrop
      # All Pages
      # ["Products", "Services", "Menu", "Galleries", "About Us", "Contact Us", "Reservation", "Feedback", "Announcements", "Videos", "Attachments", "Links", "People", "Map"]
      PRIMARY_PAGES = %w(products menu services reservation feedback contact_us)

      attributes  :id, :name, :created_at, :updated_at

      belongs_to  :template_page, with: 'Yoolk::Liquid::InstantWebsite::TemplatePageDrop'

      # Returns the localized/translated name of that page
      # @note If user customized the page's name, it will returns that name. Otherwise, it returns the localized version from its template page's name.
      # @return [String] the localized name of the page
      def name
        if object.name == template_page.name
          translate("#{theme_name}.links.#{locale_key}")
        else
          object.name
        end
      end

      def url
        page = case page_to_parameterize
               when "menu", "reservation", "feedback", "map" then "#{page_to_parameterize}_index"
               else page_to_parameterize end

        send(:"#{page}_path")
      end

      def show?
        if primary_pages?
          true
        else
          @context["request"].preview_mode? or collection_exist?
        end
      end

      def active?
        @context['request'].send(:"#{page_to_parameterize}_url?")
      end

      private

        def collection_exist?
          collection = case page_to_parameterize
                 when "brochures" then "artworks"
                 when "about_us"  then "catalog_items"
                 when "videos"    then "medias"
                 else page_to_parameterize end

          @context['listing'].send(:"#{ collection }").present?
        end

        def primary_pages?
          PRIMARY_PAGES.include? page_to_parameterize
        end

        def theme_name
          @context['request.theme_name']
        end

        def page_name
          object.name
        end

        def template_page_name
          object.template_page.name
        end

        def page_to_parameterize
          template_page_name.parameterize.underscore
        end

        def locale_key
          template_page.name.parameterize.underscore
        end
    end
  end
end