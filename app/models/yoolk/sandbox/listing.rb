module Yoolk
  module Sandbox
    class Listing < Base

      attribute :id,                      String
      attribute :alias_id,                String
      attribute :name,                    String
      attribute :address,                 String
      attribute :lat,                     Float
      attribute :long,                    Float
      attribute :zoom_level,              Integer
      attribute :headline,                String
      attribute :postal_code,             String
      attribute :description,             String
      attribute :show_map_on_web,         Boolean
      attribute :is_active,               Boolean
      attribute :source_name,             String
      attribute :created_at,              DateTime
      attribute :updated_at,              DateTime
      attribute :multilingual_ids,        Array
      attribute :app_ids,                 Array

      # relations
      attribute :portal,                  Yoolk::Sandbox::Portal
      attribute :business_type,           Yoolk::Sandbox::BusinessType
      attribute :location,                Yoolk::Sandbox::Location
      attribute :country,                 Yoolk::Sandbox::Country
      attribute :currency,                Yoolk::Sandbox::Currency
      attribute :logo,                    Yoolk::Sandbox::Listing::Logo
      attribute :communications,          Yoolk::Sandbox::Listing::Communications[Yoolk::Sandbox::Listing::Communication]
      attribute :extra_communications,    Yoolk::Sandbox::Listing::Communications[Yoolk::Sandbox::Listing::Communication]
      attribute :people,                  Yoolk::Sandbox::Listing::People[Yoolk::Sandbox::Listing::Person]
      attribute :listing_categories,      Array[Yoolk::Sandbox::Listing::Category]
      attribute :catalog_items,           Yoolk::Sandbox::Listing::CatalogItems[Yoolk::Sandbox::Listing::CatalogItem]
      attribute :image_galleries,         Array[Yoolk::Sandbox::Listing::ImageGallery]
      attribute :artworks,                Yoolk::Sandbox::Listing::Artworks[Yoolk::Sandbox::Listing::Artwork]

      attribute :service_categories,      Array[Yoolk::Sandbox::ServiceCatalog::Category]
      attribute :product_categories,      Array[Yoolk::Sandbox::ProductCatalog::Category]
      attribute :food_categories,         Array[Yoolk::Sandbox::Menu::Category]
      attribute :announcements,           Array[Yoolk::Sandbox::Listing::Announcement]
      attribute :medias,                  Yoolk::Sandbox::Listing::Medias[Yoolk::Sandbox::Listing::Media]
      attribute :business_photos,         Array[Yoolk::Sandbox::Listing::BusinessPhoto]
      attribute :keyphrases,              Array[Yoolk::Sandbox::Listing::Keyphrase]
      attribute :alias_names,             Array[Yoolk::Sandbox::Listing::AliasName]
      attribute :menu_pdf,                Yoolk::Sandbox::Attachment
      attribute :service_catalog_pdf,     Yoolk::Sandbox::Attachment
      attribute :product_catalog_pdf,     Yoolk::Sandbox::Attachment
      attribute :instant_website,         Yoolk::Sandbox::InstantWebsite::Website
      attribute :facebook_page,           Yoolk::Sandbox::Facebook::Page
      attribute :twitter_account,         Yoolk::Sandbox::Twitter::Account
      attribute :opening_hours,           Array[Yoolk::Sandbox::Listing::OpeningHour]

      attribute :links,                   Array[Yoolk::Sandbox::Listing::Link]
      attribute :attachments,             Array[Yoolk::Sandbox::Listing::Attachment]

      delegate  :locale, :language,       to: :portal

      def initialize(attributes={})
        super

        # set inverse relation for: images, services, products, foods
        image_galleries.each do |image_gallery|
          image_gallery.gallery_images.each do |gallery_image|
            gallery_image.image_gallery = image_gallery
          end
        end
        service_categories.each do |service_category|
          service_category.services.each do |service|
            service.category = service_category
          end
        end
        product_categories.each do |product_category|
          product_category.products.each do |product|
            product.category = product_category
          end
        end
        food_categories.each do |food_category|
          food_category.foods.each do |food|
            food.category = food_category
          end
        end
        instant_website.listing = self if instant_website.present?
      end

      %w(telephone email website).each do |module_name|
        singularize_method = module_name
        pluralize_method   = module_name.pluralize

        # telephones
        define_method(pluralize_method) do
          if instance_variable_get("@#{pluralize_method}")
            instance_variable_get("@#{pluralize_method}")
          else
            instance_variable_set("@#{pluralize_method}", paginate_array(communications.send(pluralize_method) + extra_communications.send(pluralize_method)))
          end
        end

        # telephone
        define_method(singularize_method) do
          send(pluralize_method).first
        end

        # telephone?
        define_method("#{singularize_method}?") do
          send(singularize_method).present?
        end
      end

      def gallery_images
        @gallery_images ||= paginate_array(image_galleries.map(&:gallery_images).flatten.sort_by(&:display_order))
      end

      def products
        @products       ||= paginate_array(product_categories.map(&:products).flatten.sort_by(&:updated_at).reverse)
      end

      def services
        @services       ||= paginate_array(service_categories.map(&:services).flatten.sort_by(&:updated_at).reverse)
      end

      def foods
        @foods          ||= paginate_array(food_categories.map(&:foods).flatten.sort_by(&:updated_at).reverse)
      end

      def categories
        @categories     ||= paginate_array(listing_categories.map(&:category).compact)
      end

      def multilinguals
        @multilinguals  ||= multilingual_ids.map { |alias_id| Yoolk::Sandbox::Listing.find(alias_id) }
      end

      def apps
        @apps           ||= app_ids.map { |app_id| Yoolk::Sandbox::App.find(app_id) }
      end

      def short_descriptions
        @short_descriptions ||= paginate_array(listing_categories.map(&:short_description).compact.uniq)
      end

      ## Alias Method
      alias_method :galleries,      :image_galleries
      alias_method :images,         :gallery_images
      alias_method :brochures,      :artworks
      alias_method :business_hours, :opening_hours

      def from_groow?
        source_name == 'groow.io'
      end

      private

        def paginate_array(value)
          if value.count.zero?
            Yoolk::Sandbox::Collection.new(value)
          else
            Yoolk::Sandbox::Collection.new(value, limit: value.count)
          end
        end
    end
  end
end