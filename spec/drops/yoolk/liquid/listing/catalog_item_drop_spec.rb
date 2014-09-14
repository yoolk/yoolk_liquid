require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CatalogItemDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:title) }
      it { should have_attribute(:html_text) }
      it { should have_attribute(:show_image) }
      it { should have_attribute(:published) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:image).class_name('Yoolk::Liquid::AttachmentDrop') }
    end
  end
end