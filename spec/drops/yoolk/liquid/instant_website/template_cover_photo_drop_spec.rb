require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::TemplateCoverPhotoDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:dimension) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:image).with('Yoolk::Liquid::AttachmentDrop') }
    end
  end
end