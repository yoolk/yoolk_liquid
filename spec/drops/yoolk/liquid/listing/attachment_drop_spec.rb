require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::AttachmentDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:file_size) }
      it { should have_attribute(:extension) }
      it { should have_attribute(:url) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
  end
end