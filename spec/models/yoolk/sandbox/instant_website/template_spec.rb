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
        expect(described_class).to have_attribute(:pages).of_type(Array)
      end

      it 'has :styles attribute' do
        expect(described_class).to have_attribute(:styles).of_type(Array)
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