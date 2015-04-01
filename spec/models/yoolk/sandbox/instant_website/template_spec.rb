require 'rails_helper'

module Yoolk
  module Sandbox

    describe InstantWebsite::Template do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :display_name attribute' do
        expect(described_class).to have_attribute(:display_name).of_type(String)
      end

      it 'has :developed_by attribute' do
        expect(described_class).to have_attribute(:developed_by).of_type(String)
      end

      it 'has :developer_url attribute' do
        expect(described_class).to have_attribute(:developer_url).of_type(String)
      end

      it 'has :demo_website attribute' do
        expect(described_class).to have_attribute(:demo_website).of_type(String)
      end

      it 'has :description attribute' do
        expect(described_class).to have_attribute(:description).of_type(String)
      end

      it 'has :is_responsive attribute' do
        expect(described_class).to have_attribute(:is_responsive)
      end

      it 'has :industries attribute' do
        expect(described_class).to have_attribute(:industries).of_type(Array)
      end

      it 'has :pages attribute' do
        expect(described_class).to have_attribute(:pages).of_type(Array, member_type: Yoolk::Sandbox::InstantWebsite::TemplatePage)
      end

      it 'has :colors attribute' do
        expect(described_class).to have_attribute(:colors).of_type(Array)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'has :thumbnail attribute' do
        expect(described_class).to have_attribute(:thumbnail).of_type(Yoolk::Sandbox::Attachment)
      end

      it 'has :cover_photo attribute' do
        expect(described_class).to have_attribute(:cover_photo).of_type(Yoolk::Sandbox::InstantWebsite::TemplateCoverPhoto)
      end
    end
  end
end