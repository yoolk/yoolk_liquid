require 'rails_helper'

module Yoolk
  module Sandbox
    describe InstantWebsite::Website do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :google_analytics_key attribute' do
        expect(described_class).to have_attribute(:google_analytics_key).of_type(String)
      end

      it 'has :is_live attribute' do
        expect(described_class).to have_attribute(:is_live)
      end

      it 'has :is_active attribute' do
        expect(described_class).to have_attribute(:is_active)
      end

      it 'has :free_plan attribute' do
        expect(described_class).to have_attribute(:free_plan)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'has :favicon attribute' do
        expect(described_class).to have_attribute(:favicon).of_type(Yoolk::Sandbox::Attachment)
      end

      it 'has :template attribute' do
        expect(described_class).to have_attribute(:template).of_type(Yoolk::Sandbox::InstantWebsite::Template)
      end

      it 'has :cover_photos attribute' do
        expect(described_class).to have_attribute(:cover_photos).of_type(Array, member_type: Yoolk::Sandbox::InstantWebsite::WebsiteCoverPhoto)
      end

      it 'has :domains attribute' do
        expect(described_class).to have_attribute(:domains).of_type(Array, member_type: Yoolk::Sandbox::InstantWebsite::Domain)
      end

      it { should delegate(:name).to(:template).with_prefix }
    end
  end
end