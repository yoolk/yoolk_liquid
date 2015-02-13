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
      subject            { described_class.new(announcement) }
      let(:announcement) { double(text: "Go to http://www.rubyonrails.org") }

      it '#url' do
        expect(subject).to receive(:announcement_url).with(subject)

        subject.url
      end

      it '#text' do
        expect(subject.text).to eq("<p>Go to <a href=\"http://www.rubyonrails.org\">http://www.rubyonrails.org</a></p>")
      end
    end
  end
end