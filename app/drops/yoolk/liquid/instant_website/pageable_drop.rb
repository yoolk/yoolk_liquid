module Yoolk
  module Liquid
    module InstantWebsite
      class PageableDrop < ::Yoolk::Liquid::BaseDrop

        # All Pages
        # ["Products", "Services", "Menu", "Galleries", "About Us", "Contact Us", "Reservation", "Feedback", "Announcements", "Videos", "Attachments", "Links", "People", "Map"]
        PRIMARY_PAGES = %w(products menu services reservation feedback contact_us)

        def url
          page = case name_to_parameterize
                 when "menu", "reservation", "feedback", "map" then "#{name_to_parameterize}_index"
                 else name_to_parameterize end

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
          @context['request'].send(:"#{name_to_parameterize}_url?")
        end

        protected

          def name_to_parameterize
            name = if object.respond_to?(:template_page)
              object.template_page.name
            else
              object.name
            end
            name.parameterize.underscore
          end

          def primary_pages?
            PRIMARY_PAGES.include? name_to_parameterize
          end

          def collection_exist?
            collection = case name_to_parameterize
                   when "brochures" then "artworks"
                   when "about_us"  then "catalog_items"
                   when "videos"    then "medias"
                   else name_to_parameterize end

            @context['listing'].send(:"#{ collection }").present?
          end

          def theme_name
            @context['request.theme_name']
          end

          alias_method :locale_key, :name_to_parameterize

      end
    end
  end
end