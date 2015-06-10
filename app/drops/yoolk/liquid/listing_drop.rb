module Yoolk
  module Liquid
    class ListingDrop < BaseDrop
      attributes  :id, :alias_id, :name, :headline, :postal_code, :description, :from_groow?,
                  :lat, :long, :zoom_level, :address, :show_map_on_web, :is_active, :api_url

      belongs_to  :location,              class_name: 'Yoolk::Liquid::LocationDrop'
      belongs_to  :language,              class_name: 'Yoolk::Liquid::LanguageDrop'
      belongs_to  :country,               class_name: 'Yoolk::Liquid::CountryDrop'
      belongs_to  :telephone,             class_name: 'Yoolk::Liquid::Listing::CommunicationDrop'
      belongs_to  :email,                 class_name: 'Yoolk::Liquid::Listing::CommunicationDrop'
      belongs_to  :website,               class_name: 'Yoolk::Liquid::Listing::CommunicationDrop'
      belongs_to  :logo,                  class_name: 'Yoolk::Liquid::Listing::LogoDrop'

      has_many    :communications,        class_name: 'Yoolk::Liquid::Listing::CommunicationsDrop',
                                          with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :extra_communications,  class_name: 'Yoolk::Liquid::Listing::ExtraCommunicationsDrop',
                                          with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :telephones,            with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :emails,                with: 'Yoolk::Liquid::Listing::CommunicationDrop'
      has_many    :websites,              with: 'Yoolk::Liquid::Listing::CommunicationDrop'

      has_many    :listing_categories,    with: 'Yoolk::Liquid::Listing::CategoryDrop'

      has_many    :catalog_items,         scope: :published,
                                          with: 'Yoolk::Liquid::Listing::CatalogItemDrop'

      has_many    :galleries,             with: 'Yoolk::Liquid::Listing::ImageGalleryDrop'
      has_many    :images,                with: 'Yoolk::Liquid::Listing::GalleryImageDrop'

      has_many    :brochures,             scope: :actives,
                                          with: 'Yoolk::Liquid::Listing::ArtworkDrop'

      has_many    :announcements,         with: 'Yoolk::Liquid::Listing::AnnouncementDrop'

      has_many    :services,              with: 'Yoolk::Liquid::ServiceCatalog::ServiceDrop'
      has_many    :service_categories,    with: 'Yoolk::Liquid::ServiceCatalog::CategoryDrop'

      has_many    :products,              with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'
      has_many    :product_categories,    with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'

      has_many    :foods,                 with: 'Yoolk::Liquid::Menu::FoodDrop'
      has_many    :food_categories,       with: 'Yoolk::Liquid::Menu::CategoryDrop'

      has_many    :short_descriptions,    with: 'Yoolk::Liquid::Listing::ShortDescriptionDrop'
      has_many    :people,                class_name: 'Yoolk::Liquid::Listing::PeopleDrop',
                                          with: 'Yoolk::Liquid::Listing::PersonDrop'

      has_many    :medias,                scope: :actives,
                                          with: 'Yoolk::Liquid::Listing::MediaDrop'

      has_many    :links,                 with: 'Yoolk::Liquid::Listing::LinkDrop'
      has_many    :attachments,           with: 'Yoolk::Liquid::Listing::AttachmentDrop'

      has_many    :business_photos,       with: 'Yoolk::Liquid::Listing::BusinessPhotoDrop'
      has_many    :keyphrases,            with: 'Yoolk::Liquid::Listing::KeyphraseDrop'
      has_many    :alias_names,           with: 'Yoolk::Liquid::Listing::AliasNameDrop'
      has_many    :business_hours,        class_name: 'Yoolk::Liquid::Listing::BusinessHoursDrop',
                                          with: 'Yoolk::Liquid::Listing::BusinessHourDrop'
      belongs_to  :facebook_page,         with: 'Yoolk::Liquid::Facebook::PageDrop'
      belongs_to  :twitter_account,       with: 'Yoolk::Liquid::Twitter::AccountDrop'

      belongs_to  :menu_pdf,              class_name: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :service_catalog_pdf,   class_name: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :product_catalog_pdf,   class_name: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :business_type,         class_name: 'Yoolk::Liquid::BusinessTypeDrop'

      belongs_to  :portal,                class_name: 'Yoolk::Liquid::PortalDrop'
      belongs_to  :instant_website,       class_name: 'Yoolk::Liquid::InstantWebsite::WebsiteDrop'
      belongs_to  :currency,              class_name: 'Yoolk::Liquid::CurrencyDrop'


      delegate    :email?, :telephone?, :website?,
                  to: :object

      def facebook_page_url
        facebook_page.try(:url)
      end

      def twitter_url
        twitter_account.try(:url)
      end

      def people
        @people ||= object.people.actives.publics
        ::Yoolk::Liquid::Listing::PeopleDrop.new(@people)
      end

      def multilinguals
        @multilinguals ||= ::Liquid::Rails::CollectionDrop.new(object.multilinguals.select { |listing| listing.instant_website.try(:domain_name).present? })
      end

      def apps
        @apps ||= ::Liquid::Rails::CollectionDrop.new(object.apps)
      end

      def summary_business_hours
        summary  = []
        group_by = business_hours.select { |item| !item.closed? }.group_by { |item| [item.open.to_s, item.closed.to_s] }
        group_by.each do |session, business_hours|
          open   = Yoolk::Liquid::HourDrop.new(session[0])
          closed = Yoolk::Liquid::HourDrop.new(session[1])
          summary << Yoolk::Liquid::Listing::SummaryBusinessHourDrop.new(business_hours.map(&:day), open, closed)
        end

        summary
      end

      def show_map?
        show_map_on_web && lat.present? && long.present?
      end

      def api_url
        ENV['API_URL']
      end

      def product_categories
        @product_categories ||= ::Liquid::Rails::CollectionDrop.new(object.product_categories.select { |category| category.name != 'uncategorized' })
      end

      ## Alias Method
      alias_method :videos, :medias
    end
  end
end
