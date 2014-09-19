require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Person do

      it 'has :title attribute' do
        expect(described_class).to have_attribute(:title).of_type(String)
      end

      it 'has :first_name attribute' do
        expect(described_class).to have_attribute(:first_name).of_type(String)
      end

      it 'has :last_name attribute' do
        expect(described_class).to have_attribute(:last_name).of_type(String)
      end

      it 'has :gender attribute' do
        expect(described_class).to have_attribute(:gender).of_type(String)
      end

      it 'has :position_title attribute' do
        expect(described_class).to have_attribute(:position_title).of_type(String)
      end

      it 'has :is_active attribute' do
        expect(described_class).to have_attribute(:is_active)
      end

      it 'has :sharing_status attribute' do
        expect(described_class).to have_attribute(:sharing_status).of_type(String)
      end

      it 'has :nationality attribute' do
        expect(described_class).to have_attribute(:nationality).of_type(Yoolk::Sandbox::Nationality)
      end
      it 'has :position_level attribute' do
        expect(described_class).to have_attribute(:position_level).of_type(Yoolk::Sandbox::PositionLevel)
      end
      it 'has :photo attribute' do
        expect(described_class).to have_attribute(:photo).of_type(Yoolk::Sandbox::Attachment)
      end

      describe Listing::Person, 'methods' do
        it { should respond_to(:communications) }
        it { should respond_to(:languages) }
      end
    end
  end
end