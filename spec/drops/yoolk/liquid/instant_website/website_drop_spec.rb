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

      it { should respond_to(:office_url) }
      it { should respond_to(:website_cover_photos) }
      it { should respond_to(:template_cover_photos) }
    end
  end
end