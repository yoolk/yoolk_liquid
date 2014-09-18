require 'rails_helper'

module Yoolk
  module Liquid
    describe PortalDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:abbreviation) }
      it { should have_attribute(:domain_name) }
      it { should have_attribute(:description) }
      it { should have_attribute(:official_name) }
      it { should have_attribute(:keywords) }
      it { should have_attribute(:time_zone) }
      it { should have_attribute(:listings_count) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:country).with('Yoolk::Liquid::CountryDrop') }
      it { should belongs_to(:language).with('Yoolk::Liquid::LanguageDrop') }
    end
  end
end