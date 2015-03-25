require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageLabelDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:template_page).with('Yoolk::Liquid::InstantWebsite::TemplatePage') }

      it { should respond_to(:name) }
      it { should respond_to(:url) }
      it { should respond_to(:collection_exist?) }
      it { should respond_to(:show?) }
      it { should respond_to(:primary_pages?) }
      it { should respond_to(:active?) }
    end
    describe InstantWebsite::PageLabelDrop, "#name" do
    end
    describe InstantWebsite::PageLabelDrop, "#url" do
    end
    describe InstantWebsite::PageLabelDrop, "#collection_exist?" do
    end
    describe InstantWebsite::PageLabelDrop, "#show?" do
    end
    describe InstantWebsite::PageLabelDrop, "#primary_pages?" do
    end
    describe InstantWebsite::PageLabelDrop, "#active?" do
    end
  end
end