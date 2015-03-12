require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageLabelDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:template_page).with('Yoolk::Liquid::InstantWebsite::TemplatePage') }
    end
  end
end