require 'rails_helper'

module Yoolk
  module Liquid
    describe CountryDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
    end
  end
end