require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::ArtworkDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:text) }
      it { should have_attribute(:description) }
      it { should have_attribute(:is_active) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:image).class_name('Yoolk::Liquid::AttachmentDrop') }
    end
  end
end