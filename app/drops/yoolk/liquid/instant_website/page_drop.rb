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
          if object.important? or preview_mode? then true
          elsif name_to_parameterize.in?(["menu", "products", "services"])
            case name_to_parameterize
            when 'menu'     then 'Menu'.in?(listing_apps)            && listing_foods.present?
            when 'products' then 'Product Catalog'.in?(listing_apps) && listing_products.present?
            when 'services' then 'Service Catalog'.in?(listing_apps) && listing_services.present?
            end
          else
            collection_exists?
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

          def listing_products
            @context['listing.products']
          end

          def listing_services
            @context['listing.services']
          end

          def listing_foods
            @context['listing.foods']
          end

          def listing_apps
            @context['listing.apps'].send(:map, &:name)
          end

          def preview_mode?
            @context['request'].preview_mode?
          end
      end
    end
  end
end