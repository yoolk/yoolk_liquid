require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::WebsiteCoverPhotoDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:caption) }
      it { should have_attribute(:dimension) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:dimension_width) }
      it { should have_attribute(:dimension_height) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:image).with('Yoolk::Liquid::AttachmentDrop') }
    end
  end
end