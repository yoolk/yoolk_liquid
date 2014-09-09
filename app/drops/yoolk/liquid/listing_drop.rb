module Yoolk
  module Liquid
    class ListingDrop < BaseDrop
      attributes  :id, :alias_id, :name, :headline, :postal_code, :description,
                  :lat, :long, :zoom_level, :address, :show_map_on_web, :is_active

      belongs_to  :location,              class_name: 'Yoolk::Liquid::LocationDrop'
      belongs_to  :country,               class_name: 'Yoolk::Liquid::CountryDrop'
      has_many    :communications,        class_name: 'Yoolk::Liquid::Listing::CommunicationsDrop',
                                          with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :extra_communications,  class_name: 'Yoolk::Liquid::Listing::ExtraCommunicationsDrop',
                                          with: 'Yoolk::Liquid::Listing::ExtraCommunicationDrop'
      has_many    :listing_categories,    with: 'Yoolk::Liquid::Listing::CategoryDrop'

      def telephone
        @telephone ||= object.telephone.to_liquid
      end

      def email
        @email ||= object.email.to_liquid
      end

      def website
        @website ||= object.website.to_liquid
      end
    end
  end
end