module Yoolk
  module Liquid
    module InstantWebsite
      class PageDrop < BaseDrop

        attributes  :id, :name, :display_order,
                    :meta_title, :meta_description, :meta_keyword, :created_at, :updated_at

        belongs_to  :website,       with: 'Yoolk::Liquid::InstantWebsite::WebsiteDrop'
        belongs_to  :template_page, with: 'Yoolk::Liquid::InstantWebsite::TemplatePageDrop'

        delegate    :home?, :announcements?, :brochures?, :videos?,
                    :map?, :about_us?, :people?, :links?, :menu?,
                    :feedback?, :reservation?, :photos?, :galleries?, 
                    :contact_us?, :attachments?, :services?, :products?, 
                    to: :template_page

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
          if object.important? || preview_mode?
            true
          elsif object.template_page.about_us?
            @context['listing.catalog_items'].present? || @context['listing.business_photos'].present?
          elsif object.template_page.map?
            @context['listing.show_map_on_web'] && @context['listing.lat'].present? && @context['listing.long'].present?
          elsif object.template_page.menu?
            listing_apps.include?("Menu") && listing_foods.present?
          elsif object.template_page.products?
            listing_apps.include?("Product Catalog") && listing_products.present?
          elsif object.template_page.services?
            listing_apps.include?("Service Catalog") && listing_services.present?
          elsif object.template_page.photos?
            @context['listing'].galleries.present?
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
            @context['listing'].try(:"#{ name_to_parameterize }").present?
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
            @context['request.preview_mode?']
          end
      end
    end
  end
end
