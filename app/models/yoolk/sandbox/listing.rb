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
      attribute :communications,          Array[Yoolk::Sandbox::Listing::Communication]
      attribute :extra_communications,    Array[Yoolk::Sandbox::Listing::ExtraCommunication]
      attribute :listing_categories,      Array[Yoolk::Sandbox::Listing::Category]
      attribute :service_categories,      Array[Yoolk::Sandbox::ServiceCatalog::Category]

      def self.find(alias_id)
        path       = Rails.root.join('db', 'samples', 'jsons', "#{alias_id}.json")
        attributes = Oj.load(File.read(path))

        new(attributes)
      end

      def initialize(attributes={})
        super
        service_categories.each do |service_category|
          service_category.services.each do |service|
            service.category = service_category
          end
        end
      end

      def services
        @services ||= initialize_collection(service_categories.map(&:services).flatten.sort_by(&:updated_at).reverse)
      end

      def telephone
        communications[0]
      end

      def email
        communications[-1]
      end

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