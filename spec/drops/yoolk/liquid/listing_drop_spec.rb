require 'rails_helper'

module Yoolk
  module Liquid
    describe ListingDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:alias_id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:headline) }
      it { should have_attribute(:postal_code) }
      it { should have_attribute(:description) }
      it { should have_attribute(:lat) }
      it { should have_attribute(:long) }
      it { should have_attribute(:zoom_level) }
      it { should have_attribute(:address) }
      it { should have_attribute(:show_map_on_web) }
      it { should have_attribute(:is_active) }
      it { should belongs_to(:business_type).class_name('Yoolk::Liquid::BusinessTypeDrop') }
      it { should belongs_to(:location).class_name('Yoolk::Liquid::LocationDrop') }
      it { should belongs_to(:country).class_name('Yoolk::Liquid::CountryDrop') }
      it { should belongs_to(:telephone).class_name('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should belongs_to(:email).class_name('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should belongs_to(:website).class_name('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should belongs_to(:logo).class_name('Yoolk::Liquid::Listing::LogoDrop') }
      it { should belongs_to(:product_catalog_pdf).class_name('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:service_catalog_pdf).class_name('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:menu_pdf).class_name('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:instant_website).class_name('Yoolk::Liquid::InstantWebsite::WebsiteDrop') }
      it { should belongs_to(:portal).class_name('Yoolk::Liquid::PortalDrop') }

      it { should have_many(:communications).class_name('Yoolk::Liquid::Listing::CommunicationsDrop').with('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:extra_communications).class_name('Yoolk::Liquid::Listing::ExtraCommunicationsDrop').with('Yoolk::Liquid::Listing::ExtraCommunicationDrop') }
      it { should have_many(:telephones).with('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:emails).with('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:websites).with('Yoolk::Liquid::Listing::CommunicationDrop') }

      it { should have_many(:listing_categories).with('Yoolk::Liquid::Listing::CategoryDrop') }
      it { should have_many(:people).class_name('Yoolk::Liquid::Listing::PeopleDrop').with('Yoolk::Liquid::Listing::PersonDrop') }
      it { should have_many(:medias).with('Yoolk::Liquid::Listing::MediaDrop') }
      it { should have_many(:business_photos).with('Yoolk::Liquid::Listing::BusinessPhotoDrop') }
      it { should have_many(:keyphrases).with('Yoolk::Liquid::Listing::KeyphraseDrop') }
      it { should have_many(:alias_names).with('Yoolk::Liquid::Listing::AliasNameDrop') }

      it { should have_many(:catalog_items).with('Yoolk::Liquid::Listing::CatalogItemDrop') }
      it { should have_many(:galleries).with('Yoolk::Liquid::Listing::ImageGalleryDrop') }
      it { should have_many(:images).with('Yoolk::Liquid::Listing::GalleryImageDrop') }
      it { should have_many(:brochures).with('Yoolk::Liquid::Listing::ArtworkDrop') }
      it { should have_many(:announcements).with('Yoolk::Liquid::Listing::AnnouncementDrop') }

      it { should have_many(:products).with('Yoolk::Liquid::ProductCatalog::ProductDrop') }
      it { should have_many(:product_categories).with('Yoolk::Liquid::ProductCatalog::CategoryDrop') }

      it { should have_many(:services).with('Yoolk::Liquid::ServiceCatalog::ServiceDrop') }
      it { should have_many(:service_categories).with('Yoolk::Liquid::ServiceCatalog::CategoryDrop') }

      it { should have_many(:foods).with('Yoolk::Liquid::Menu::FoodDrop') }
      it { should have_many(:food_categories).with('Yoolk::Liquid::Menu::CategoryDrop') }
      it { should belongs_to(:facebook_page).with('Yoolk::Liquid::Facebook::PageDrop') }
      it { should belongs_to(:twitter_account).with('Yoolk::Liquid::Twitter::AccountDrop') }
      it { should have_many(:business_hours).with('Yoolk::Liquid::Listing::BusinessHourDrop') }
      it { should have_many(:multilinguals).with('Yoolk::Liquid::ListingDrop') }
    end
  end
end