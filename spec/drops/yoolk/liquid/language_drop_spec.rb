require 'rails_helper'

module Yoolk
  module Liquid
    describe LanguageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:two_code) }
    end
  end
end