require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::ExtraCommunicationDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:type) }
      it { should have_attribute(:label) }
      it { should have_attribute(:value) }
    end
  end
end