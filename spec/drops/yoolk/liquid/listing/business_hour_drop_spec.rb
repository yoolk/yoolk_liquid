require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::BusinessHourDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:day) }
      it { should have_attribute(:today?) }
      it { should have_attribute(:full_day?) }
      it { should have_attribute(:open?) }
      it { should have_attribute(:closed?) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should respond_to(:open) }
      it { should respond_to(:closed) }
      it { should respond_to(:day_name) }
      it { should respond_to(:abbr_day_name) }
    end
  end
end