require 'rails_helper'

module Yoolk
  module Sandbox

    describe Facebook::Page do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :page_id attribute' do
        expect(described_class).to have_attribute(:page_id).of_type(String)
      end

      it 'has :page_url attribute' do
        expect(described_class).to have_attribute(:page_url).of_type(String)
      end

      it 'has :page_name attribute' do
        expect(described_class).to have_attribute(:page_name).of_type(String)
      end

      it 'has :page_access_token attribute' do
        expect(described_class).to have_attribute(:page_access_token).of_type(String)
      end

      it 'has :cover_photo_url attribute' do
        expect(described_class).to have_attribute(:cover_photo_url).of_type(String)
      end

      it 'has :installed_page_ids attribute' do
        expect(described_class).to have_attribute(:installed_page_ids).of_type(Array)
      end

      it 'has :photo_uploaded_status attribute' do
        expect(described_class).to have_attribute(:photo_uploaded_status).of_type(String)
      end
      it 'has :is_published attribute' do
        expect(described_class).to have_attribute(:is_published)
      end
      it 'has :last_photo_uploaded_at attribute' do
        expect(described_class).to have_attribute(:last_photo_uploaded_at).of_type(DateTime)
      end
    end
  end
end