module Yoolk
  module Liquid
    module InstantWebsite
      module PageableDrop

        # All Pages
        # ["Products", "Services", "Menu", "Galleries", "About Us", "Contact Us", "Reservation", "Feedback", "Announcements", "Videos", "Attachments", "Links", "People", "Map"]
        PRIMARY_PAGES = %w(home products menu services reservation feedback contact_us)

        def url
          send(:"#{name_to_parameterize}_url")
        end

        def show?
          if primary_page?
            true
          else
            @context['request'].preview_mode? || collection_exists?
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
          alias_method :locale_key, :name_to_parameterize

          def primary_page?
            PRIMARY_PAGES.include?(name_to_parameterize)
          end

          def collection_exists?
            collection = case name_to_parameterize
              when "brochures" then "artworks"
              when "about_us"  then "catalog_items"
              when "videos"    then "medias"
              else name_to_parameterize end

            @context['listing'].try(:"#{ collection }").present?
          end

          def theme_name
            @context['request.theme_name']
          end

      end
    end
  end
end