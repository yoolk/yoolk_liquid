require 'rails_helper'

module Yoolk
  module Liquid
    describe HourDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:hour) }
      it { should have_attribute(:minute) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
    end
  end
end