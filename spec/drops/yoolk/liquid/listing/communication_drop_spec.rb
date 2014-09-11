require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CommunicationDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:type) }
      it { should have_attribute(:value) }
      it { should have_attribute(:is_first_line) }
      it { should have_attribute(:image_url) }
    end
  end
end