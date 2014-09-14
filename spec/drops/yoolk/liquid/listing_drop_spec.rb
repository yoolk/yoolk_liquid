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
      it { should belongs_to(:location).class_name('Yoolk::Liquid::LocationDrop') }
      it { should belongs_to(:country).class_name('Yoolk::Liquid::CountryDrop') }

      it { should belongs_to(:telephone).class_name('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should belongs_to(:email).class_name('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should belongs_to(:website).class_name('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:communications).class_name('Yoolk::Liquid::Listing::CommunicationsDrop').with('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:extra_communications).class_name('Yoolk::Liquid::Listing::ExtraCommunicationsDrop').with('Yoolk::Liquid::Listing::ExtraCommunicationDrop') }
      it { should have_many(:listing_categories).with('Yoolk::Liquid::Listing::CategoryDrop') }

      it { should have_many(:galleries).with('Yoolk::Liquid::Listing::ImageGalleryDrop') }
      it { should have_many(:images).with('Yoolk::Liquid::Listing::GalleryImageDrop') }

      it { should have_many(:services).with('Yoolk::Liquid::ServiceCatalog::ServiceDrop') }
      it { should have_many(:service_categories).with('Yoolk::Liquid::ServiceCatalog::CategoryDrop') }

      it { should have_many(:foods).with('Yoolk::Liquid::Menu::FoodDrop') }
      it { should have_many(:food_categories).with('Yoolk::Liquid::Menu::CategoryDrop') }
    end
  end
end