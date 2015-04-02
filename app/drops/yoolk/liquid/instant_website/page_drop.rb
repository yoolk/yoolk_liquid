module Yoolk
  module Liquid
    module InstantWebsite
      class PageDrop < BaseDrop

        attributes  :id, :name, :display_order, :created_at, :updated_at

        belongs_to  :website,       with: 'Yoolk::Liquid::InstantWebsite::WebsiteDrop'
        belongs_to  :template_page, with: 'Yoolk::Liquid::InstantWebsite::TemplatePageDrop'

        # Returns the localized/translated name of that page
        # @note If user customized the page's name, it will returns that name. Otherwise, it returns the localized version from its template page's name.
        # @return [String] the localized name of the page
        def name
          if object.name == object.template_page.name
            translate("#{theme_name}.links.#{locale_key}")
          else
            object.name
          end
        end

        def url
          send(:"#{name_to_parameterize}_url")
        end

        def show?
          if object.important?
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
            template_page.name.parameterize.underscore
          end
          alias_method :locale_key, :name_to_parameterize

          def collection_exists?
            collection = case name_to_parameterize
              when 'brochures' then 'artworks'
              when 'about_us'  then 'catalog_items'
              when 'videos'    then 'medias'
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