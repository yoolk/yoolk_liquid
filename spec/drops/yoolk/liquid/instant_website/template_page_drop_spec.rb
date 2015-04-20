require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::TemplatePageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should delegate(:menu?).to(:object) }
      it { should delegate(:products?).to(:object) }
      it { should delegate(:services?).to(:object) }
    end
  end
end