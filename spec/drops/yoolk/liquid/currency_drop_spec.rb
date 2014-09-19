require 'rails_helper'

module Yoolk
  module Liquid
    describe CurrencyDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:code) }
    end
  end
end