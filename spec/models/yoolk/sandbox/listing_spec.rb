require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing, 'model' do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :alias_id attribute' do
        expect(described_class).to have_attribute(:alias_id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :address attribute' do
        expect(described_class).to have_attribute(:address).of_type(String)
      end

      it 'has :lat attribute' do
        expect(described_class).to have_attribute(:lat).of_type(Float)
      end

      it 'has :long attribute' do
        expect(described_class).to have_attribute(:long).of_type(Float)
      end

      it 'has :zoom_level attribute' do
        expect(described_class).to have_attribute(:zoom_level).of_type(Integer)
      end

      it 'has :headline attribute' do
        expect(described_class).to have_attribute(:headline).of_type(String)
      end

      it 'has :postal_code attribute' do
        expect(described_class).to have_attribute(:postal_code).of_type(String)
      end

      it 'has :description attribute' do
        expect(described_class).to have_attribute(:description).of_type(String)
      end

      it 'has :is_active attribute' do
        expect(described_class).to have_attribute(:is_active)
      end

      it 'has :show_map_on_web attribute' do
        expect(described_class).to have_attribute(:show_map_on_web)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'has :multilingual_ids attribute' do
        expect(described_class).to have_attribute(:multilingual_ids).of_type(Array)
      end

      it 'has :app_ids attribute' do
        expect(described_class).to have_attribute(:app_ids).of_type(Array)
      end

      it 'has :location attribute' do
        expect(described_class).to have_attribute(:location).of_type(Yoolk::Sandbox::Location)
      end

      it 'has :country attribute' do
        expect(described_class).to have_attribute(:country).of_type(Yoolk::Sandbox::Country)
      end

      it 'has :logo attribute' do
        expect(described_class).to have_attribute(:logo).of_type(Yoolk::Sandbox::Listing::Logo)
      end

      it 'has :business_type attribute' do
        expect(described_class).to have_attribute(:business_type).of_type(Yoolk::Sandbox::BusinessType)
      end

      it 'has :portal attribute' do
        expect(described_class).to have_attribute(:portal).of_type(Yoolk::Sandbox::Portal)
      end

      it 'has :instant_website attribute' do
        expect(described_class).to have_attribute(:instant_website).of_type(Yoolk::Sandbox::InstantWebsite::Website)
      end

      it 'has :service_catalog_pdf attribute' do
        expect(described_class).to have_attribute(:service_catalog_pdf).of_type(Yoolk::Sandbox::Attachment)
      end

      it 'has :product_catalog_pdf attribute' do
        expect(described_class).to have_attribute(:product_catalog_pdf).of_type(Yoolk::Sandbox::Attachment)
      end

      it 'has :menu_pdf attribute' do
        expect(described_class).to have_attribute(:menu_pdf).of_type(Yoolk::Sandbox::Attachment)
      end

      it 'has :communications attribute' do
        expect(described_class).to have_attribute(:communications).of_type(Yoolk::Sandbox::Listing::Communications, member_type: Yoolk::Sandbox::Listing::Communication)
      end

      it 'has :extra_communications attribute' do
        expect(described_class).to have_attribute(:extra_communications).of_type(Yoolk::Sandbox::Listing::Communications, member_type: Yoolk::Sandbox::Listing::Communication)
      end

      it 'has :listing_categories attribute' do
        expect(described_class).to have_attribute(:listing_categories).of_type(Array, member_type: Yoolk::Sandbox::Listing::Category)
      end

      it 'has :catalog_items attribute' do
        expect(described_class).to have_attribute(:catalog_items).of_type(Yoolk::Sandbox::Listing::CatalogItems, member_type: Yoolk::Sandbox::Listing::CatalogItem)
      end

      it 'has :image_galleries attribute' do
        expect(described_class).to have_attribute(:image_galleries).of_type(Yoolk::Sandbox::Listing::ImageGalleries, member_type: Yoolk::Sandbox::Listing::ImageGallery)
      end

      it 'has :artworks attribute' do
        expect(described_class).to have_attribute(:artworks).of_type(Yoolk::Sandbox::Listing::Artworks, member_type: Yoolk::Sandbox::Listing::Artwork)
      end

      it 'has :product_categories attribute' do
        expect(described_class).to have_attribute(:product_categories).of_type(Yoolk::Sandbox::ProductCatalog::Categories, member_type: Yoolk::Sandbox::ProductCatalog::Category)
      end

      it 'has :service_categories attribute' do
        expect(described_class).to have_attribute(:service_categories).of_type(Array, member_type: Yoolk::Sandbox::ServiceCatalog::Category)
      end

      it 'has :food_categories attribute' do
        expect(described_class).to have_attribute(:food_categories).of_type(Array, member_type: Yoolk::Sandbox::Menu::Category)
      end

      it 'has :medias attribute' do
        expect(described_class).to have_attribute(:medias).of_type(Yoolk::Sandbox::Listing::Medias, member_type: Yoolk::Sandbox::Listing::Media)
      end

      it 'has :business_photos attribute' do
        expect(described_class).to have_attribute(:business_photos).of_type(Array, member_type: Yoolk::Sandbox::Listing::BusinessPhoto)
      end

      it 'has :keyphrases attribute' do
        expect(described_class).to have_attribute(:keyphrases).of_type(Array, member_type: Yoolk::Sandbox::Listing::Keyphrase)
      end

      it 'has :alias_names attribute' do
        expect(described_class).to have_attribute(:alias_names).of_type(Array, member_type: Yoolk::Sandbox::Listing::AliasName)
      end

      it 'has :facebook_page attribute' do
        expect(described_class).to have_attribute(:facebook_page).of_type(Yoolk::Sandbox::Facebook::Page)
      end

      it 'has :twitter_account attribute' do
        expect(described_class).to have_attribute(:twitter_account).of_type(Yoolk::Sandbox::Twitter::Account)
      end

      it 'has :opening_hours attribute' do
        expect(described_class).to have_attribute(:opening_hours).of_type(Array, member_type: Yoolk::Sandbox::Listing::OpeningHour)
      end

      it 'has :links attribute' do
        expect(described_class).to have_attribute(:links).of_type(Array, member_type: Yoolk::Sandbox::Listing::Link)
      end

      it 'has :attachments attribute' do
        expect(described_class).to have_attribute(:attachments).of_type(Array, member_type: Yoolk::Sandbox::Listing::Attachment)
      end
    end

    describe Listing, 'methods' do
      it { should respond_to(:products) }
      it { should respond_to(:services) }
      it { should respond_to(:foods) }
      it { should respond_to(:gallery_images) }
      it { should respond_to(:short_descriptions) }

      it { should respond_to(:telephones) }
      it { should respond_to(:emails) }
      it { should respond_to(:websites) }
      it { should respond_to(:telephone) }
      it { should respond_to(:email) }
      it { should respond_to(:website) }
      it { should respond_to(:telephone?) }
      it { should respond_to(:email?) }
      it { should respond_to(:website?) }
      it { should respond_to(:multilinguals) }
      it { should respond_to(:apps) }
      it { should respond_to(:from_groow?) }

      it { should alias_from(:image_galleries).to(:galleries) }
      it { should alias_from(:gallery_images).to(:images) }
      it { should alias_from(:artworks).to(:brochures) }
      it { should alias_from(:opening_hours).to(:business_hours) }

      it { should delegate(:language).to(:portal) }
      it { should delegate(:locale).to(:portal) }
    end
  end
end