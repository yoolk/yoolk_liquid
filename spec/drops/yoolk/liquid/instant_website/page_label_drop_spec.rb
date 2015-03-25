require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageDrop do
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
    describe InstantWebsite::PageDrop, "#name" do
    end
    describe InstantWebsite::PageDrop, "#url" do
    end
    describe InstantWebsite::PageDrop, "#collection_exist?" do
    end
    describe InstantWebsite::PageDrop, "#show?" do
    end
    describe InstantWebsite::PageDrop, "#primary_pages?" do
    end
    describe InstantWebsite::PageDrop, "#active?" do
    end
  end
end