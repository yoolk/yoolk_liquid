require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::PersonDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:title) }
      it { should have_attribute(:first_name) }
      it { should have_attribute(:last_name) }
      it { should have_attribute(:gender) }
      it { should have_attribute(:position_title) }
      it { should have_attribute(:is_active) }
      it { should have_attribute(:sharing_status) }

      it { should belongs_to(:nationality).with('Yoolk::Liquid::NationalityDrop') }
      it { should belongs_to(:position_level).with('Yoolk::Liquid::PositionLevelDrop') }
      it { should belongs_to(:photo).with('Yoolk::Liquid::AttachmentDrop') }

      it { should have_many(:communications).with('Yoolk::Liquid::Listing::CommunicationDrop') }
      it { should have_many(:languages).with('Yoolk::Liquid::LanguageDrop') }
    end
  end
end