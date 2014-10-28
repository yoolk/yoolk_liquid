require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::WebsiteDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:google_analytics_key) }
      it { should have_attribute(:is_live) }
      it { should have_attribute(:is_active) }
      it { should have_attribute(:free_plan) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:favicon).with('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:template).with('Yoolk::Liquid::InstantWebsite::TemplateDrop') }

      it { should have_many(:cover_photos).with('Yoolk::Liquid::InstantWebsite::WebsiteCoverPhotoDrop') }
      it { should have_many(:domains).with('Yoolk::Liquid::InstantWebsite::DomainDrop') }
    end

    describe InstantWebsite::WebsiteDrop do
      subject { described_class.new(double) }
      let(:listing) { Yoolk::Sandbox::Listing.new({'instant_website' => { 'template' => { 'cover_photo' => { 'dimension' => '1140x422', 'image' => { 'attachment_meta' => { 'original' => { 'width' => '1140', 'height' => '422'} } } } }, 'cover_photos' => [{ 'dimension' => '1140x422' }, { 'dimension' => '994x368' }]}}) }

      it { should respond_to(:office_url) }

      it "#website_cover_photos: return matched cover photos to template cover photos" do
        expect(listing.instant_website.cover_photos.count).to eq(2)
      end
      it "#template_cover_photos" do
      end
    end
  end
end