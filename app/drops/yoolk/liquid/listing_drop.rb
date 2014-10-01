module Yoolk
  module Liquid
    class ListingDrop < BaseDrop
      attributes  :id, :alias_id, :name, :headline, :postal_code, :description,
                  :lat, :long, :zoom_level, :address, :show_map_on_web, :is_active

      belongs_to  :location,              class_name: 'Yoolk::Liquid::LocationDrop'
      belongs_to  :country,               class_name: 'Yoolk::Liquid::CountryDrop'
      belongs_to  :telephone,             class_name: 'Yoolk::Liquid::Listing::CommunicationDrop'
      belongs_to  :email,                 class_name: 'Yoolk::Liquid::Listing::CommunicationDrop'
      belongs_to  :website,               class_name: 'Yoolk::Liquid::Listing::CommunicationDrop'
      belongs_to  :logo,                  class_name: 'Yoolk::Liquid::Listing::LogoDrop'

      has_many    :communications,        class_name: 'Yoolk::Liquid::Listing::CommunicationsDrop',
                                          with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :extra_communications,  class_name: 'Yoolk::Liquid::Listing::ExtraCommunicationsDrop',
                                          with: 'Yoolk::Liquid::Listing::ExtraCommunicationDrop'
      has_many    :telephones,            with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :emails,                with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :websites,              with: 'Yoolk::Liquid::Listing::CommunicationDrop'

      has_many    :listing_categories,    with: 'Yoolk::Liquid::Listing::CategoryDrop'
      has_many    :catalog_items,         with: 'Yoolk::Liquid::Listing::CatalogItemDrop'
      has_many    :galleries,             with: 'Yoolk::Liquid::Listing::ImageGalleryDrop'
      has_many    :images,                with: 'Yoolk::Liquid::Listing::GalleryImageDrop'
      has_many    :brochures,             with: 'Yoolk::Liquid::Listing::ArtworkDrop'
      has_many    :announcements,         with: 'Yoolk::Liquid::Listing::AnnouncementDrop'

      has_many    :services,              with: 'Yoolk::Liquid::ServiceCatalog::ServiceDrop'
      has_many    :service_categories,    with: 'Yoolk::Liquid::ServiceCatalog::CategoryDrop'

      has_many    :products,              with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'
      has_many    :product_categories,    with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'

      has_many    :foods,                 with: 'Yoolk::Liquid::Menu::FoodDrop'
      has_many    :food_categories,       with: 'Yoolk::Liquid::Menu::CategoryDrop'

      has_many    :people,                class_name: 'Yoolk::Liquid::Listing::PeopleDrop',
                                          with: 'Yoolk::Liquid::Listing::PersonDrop'
      has_many    :medias,                with: 'Yoolk::Liquid::Listing::MediaDrop'
      has_many    :business_photos,       with: 'Yoolk::Liquid::Listing::BusinessPhotoDrop'
      has_many    :keyphrases,            with: 'Yoolk::Liquid::Listing::KeyphraseDrop'
      has_many    :alias_names,           with: 'Yoolk::Liquid::Listing::AliasNameDrop'
      belongs_to  :facebook_page,         with: 'Yoolk::Liquid::Facebook::PageDrop'

      belongs_to  :menu_pdf,              class_name: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :service_catalog_pdf,   class_name: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :product_catalog_pdf,   class_name: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :business_type,         class_name: 'Yoolk::Liquid::BusinessTypeDrop'

      belongs_to  :portal,                class_name: 'Yoolk::Liquid::PortalDrop'
      belongs_to  :instant_website,       class_name: 'Yoolk::Liquid::InstantWebsite::WebsiteDrop'

    end
  end
end