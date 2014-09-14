require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::AnnouncementDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:text) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:image).class_name('Yoolk::Liquid::AttachmentDrop') }
    end

    describe Listing::AnnouncementDrop, 'methods' do
      let(:drop)      { described_class.new(double) }

      it '#url' do
        expect(drop).to receive(:announcement_url).with(drop)

        drop.url
      end
    end
  end
end