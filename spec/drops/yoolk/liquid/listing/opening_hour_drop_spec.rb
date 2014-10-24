require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::BusinessHourDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:day) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:open).with('Yoolk::Liquid::HourDrop') }
      it { should belongs_to(:close).with('Yoolk::Liquid::HourDrop') }
    end

  end
end