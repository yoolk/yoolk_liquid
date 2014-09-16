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
      attribute :created_at,              DateTime
      attribute :updated_at,              DateTime

      # relations
      attribute :location,                Yoolk::Sandbox::Location
      attribute :country,                 Yoolk::Sandbox::Country
      attribute :logo,                    Yoolk::Sandbox::Listing::Logo
      attribute :communications,          Array[Yoolk::Sandbox::Listing::Communication]
      attribute :extra_communications,    Array[Yoolk::Sandbox::Listing::ExtraCommunication]
      attribute :listing_categories,      Array[Yoolk::Sandbox::Listing::Category]
      attribute :catalog_items,           Array[Yoolk::Sandbox::Listing::CatalogItem]
      attribute :image_galleries,         Array[Yoolk::Sandbox::Listing::ImageGallery]
      attribute :artworks,                Array[Yoolk::Sandbox::Listing::Artwork]

      attribute :service_categories,      Array[Yoolk::Sandbox::ServiceCatalog::Category]
      attribute :product_categories,      Array[Yoolk::Sandbox::ProductCatalog::Category]
      attribute :food_categories,         Array[Yoolk::Sandbox::Menu::Category]
      attribute :announcements,           Array[Yoolk::Sandbox::Listing::Announcement]
      attribute :people,                  Array[Yoolk::Sandbox::Listing::Person]
      attribute :medias,                  Array[Yoolk::Sandbox::Listing::Media]
      attribute :business_photos,         Array[Yoolk::Sandbox::Listing::BusinessPhoto]
      attribute :keyphrases,              Array[Yoolk::Sandbox::Listing::Keyphrase]
      attribute :alias_names,             Array[Yoolk::Sandbox::Listing::AliasName]

      def self.find(alias_id)
        path       = Rails.root.join('db', 'samples', 'jsons', "#{alias_id}.json")
        attributes = Oj.load(File.read(path))

        new(attributes)
      end

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
      end

      def gallery_images
        @gallery_images ||= initialize_collection(image_galleries.map(&:gallery_images).flatten.sort_by(&:display_order))
      end

      def products
        @products       ||= initialize_collection(product_categories.map(&:products).flatten.sort_by(&:updated_at).reverse)
      end

      def services
        @services       ||= initialize_collection(service_categories.map(&:services).flatten.sort_by(&:updated_at).reverse)
      end

      def foods
        @foods          ||= initialize_collection(food_categories.map(&:foods).flatten.sort_by(&:updated_at).reverse)
      end

      def telephone
        communications[0]
      end

      def email
        communications[-1]
      end

      ## Alias Method
      alias_method :galleries, :image_galleries
      alias_method :images,    :gallery_images
      alias_method :brochures, :artworks

      private

        def initialize_collection(value)
          if value.count.zero?
            Yoolk::Sandbox::Collection.new(value)
          else
            Yoolk::Sandbox::Collection.new(value, limit: value.count)
          end
        end
    end
  end
end