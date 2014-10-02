require 'rails_helper'

module Yoolk
  module Sandbox

    describe Twitter::Account do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :username attribute' do
        expect(described_class).to have_attribute(:username).of_type(String)
      end

      it 'has :email attribute' do
        expect(described_class).to have_attribute(:email).of_type(String)
      end

      it 'has :published attribute' do
        expect(described_class).to have_attribute(:published)
      end

      it 'has :profile_url attribute' do
        expect(described_class).to have_attribute(:profile_url).of_type(String)
      end

    end
  end
end