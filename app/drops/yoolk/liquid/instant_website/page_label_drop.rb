module Yoolk
  module Liquid
    class InstantWebsite::PageLabelDrop < BaseDrop
      PRIMARY_PAGES = ["products", "menu", "services", "reservation", "feedback", "contact_us"]

      attributes  :id, :name, :created_at, :updated_at

      belongs_to  :template_page,      with: 'Yoolk::Liquid::InstantWebsite::TemplatePage'

      def name
        if page_name.parameterize.underscore == page_to_parameterize
          I18n.t("links.#{page_to_parameterize}")
        else
          page_name
        end
      end

      def url
        page = case page_to_parameterize
               when "menu", "reservation", "feedback", "map" then "#{page_to_parameterize}_index"
               else page_to_parameterize end

        send(:"#{page}_path")
      end

      def collection_exist?
        collection = case page_to_parameterize
               when "brochures" then "artworks"
               when "about_us"  then "catalog_items"
               when "videos"    then "medias"
               else page_to_parameterize end

        @context['listing'].send(:"#{ collection }").present?
      end

      def show?
        if primary_pages?
          true
        else
          @context["request"].preview_mode? or collection_exist?
        end
      end

      def primary_pages?
        PRIMARY_PAGES.include? page_to_parameterize
      end

      def active?
        @context['request'].send(:"#{page_to_parameterize}_url?")
      end

      private

        def page_name
          object.name
        end

        def template_page_name
          object.template_page.name
        end

        def page_to_parameterize
          template_page_name.parameterize.underscore
        end
    end
  end
end