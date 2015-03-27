module Yoolk
  module Liquid
    module InstantWebsite
      class TemplatePageDrop < BaseDrop
        PRIMARY_PAGES = %w(products menu services reservation feedback contact_us)

        attributes  :id, :name, :display_order, :created_at, :updated_at

        def name
          translate("#{theme_name}.links.#{locale_key}")
        end

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

      private

        def collection_exist?
          collection = case name_to_parameterize
                 when "brochures" then "artworks"
                 when "about_us"  then "catalog_items"
                 when "videos"    then "medias"
                 else name_to_parameterize end

          @context['listing'].send(:"#{ collection }").present?
        end

        def primary_pages?
          PRIMARY_PAGES.include? name_to_parameterize
        end

        def theme_name
          @context['request.theme_name']
        end

        def name_to_parameterize
          object.name.parameterize.underscore
        end

        alias_method :locale_key, :name_to_parameterize
        # def locale_key
        #   template_page.name.parameterize.underscore
        # end


      end
    end
  end
end