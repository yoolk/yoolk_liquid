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

    describe Listing::PersonDrop, '#methods' do
      let(:person) { Yoolk::Sandbox::Listing::Person.new }
      subject      { person.to_liquid }

      it 'male? return true when person gender is Male' do
        person.gender  = 'Male'

        expect(subject.male?).to eq(true)
      end

      it 'female? return true when person gender is Female' do
        person.gender  = 'Female'

        expect(subject.female?).to eq(true)
      end

      it 'fullname return first name and last name concatenat with whitespace' do
        person.first_name  = 'James'
        person.last_name   = 'Ron'

        expect(subject.fullname).to eq('James Ron')
      end

    end
  end
end