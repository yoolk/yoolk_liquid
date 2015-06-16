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
      it { should belongs_to(:currency).class_name('Yoolk::Liquid::CurrencyDrop') }
      it { should belongs_to(:portal).class_name('Yoolk::Liquid::PortalDrop') }

      it { should have_many(:communications).class_name('Yoolk::Liquid::Listing::CommunicationsDrop').with('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:extra_communications).class_name('Yoolk::Liquid::Listing::ExtraCommunicationsDrop').with('Yoolk::Liquid::Listing::CommunicationDrop') }
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
      it { should have_many(:business_hours).class_name('Yoolk::Liquid::Listing::BusinessHoursDrop').with('Yoolk::Liquid::Listing::BusinessHourDrop') }
      it { should have_many(:short_descriptions).with('Yoolk::Liquid::Listing::ShortDescriptionDrop') }
      it { should have_many(:links).with('Yoolk::Liquid::Listing::LinkDrop') }
      it { should have_many(:attachments).with('Yoolk::Liquid::Listing::AttachmentDrop') }

      it { should respond_to(:multilinguals) }
      it { should respond_to(:show_map?) }
      it { should respond_to(:videos) }
      it { should respond_to(:product_categories) }
      it { should respond_to(:food_categories) }

      it { should delegate(:email?).to(:object) }
      it { should delegate(:telephone?).to(:object) }
      it { should delegate(:website?).to(:object) }

      context 'methods' do
        describe 'api_url' do
          it { should have_attribute(:api_url)}

          it 'should eq value in ENV' do
            expect(subject.api_url).to be_present
            expect(subject.api_url).to eq(ENV['API_URL'])
          end
        end
        describe 'Product' do
          it 'collects non uncategorized categories' do
            categor1 = build(:product_category, name: 'Uncategorized')
            categor2 = build(:product_category, name: 'Spare parts')
            listing  = build(:listing, product_categories: [categor1, categor2])

            expect(listing.to_liquid.product_categories.count).to eq(1)
            expect(listing.to_liquid.product_categories.first.name).to eq('Spare parts')
          end
        end

        describe 'Menu' do
          it 'collects non uncategorized categories' do
            categor1 = build(:category, name: 'Uncategorized')
            categor2 = build(:category, name: 'Ice Cream')
            listing  = build(:listing, food_categories: [categor1, categor2])

            expect(listing.to_liquid.food_categories.count).to eq(1)
            expect(listing.to_liquid.food_categories.first.name).to eq('Ice Cream')
          end
        end
      end
    end
  end
end
