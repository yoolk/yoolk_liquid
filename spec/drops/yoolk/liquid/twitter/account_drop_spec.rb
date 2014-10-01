require 'rails_helper'

module Yoolk
  module Liquid
    describe Twitter::AccountDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:username) }
      it { should have_attribute(:email) }
      it { should have_attribute(:published) }
      it { should have_attribute(:profile_url) }

    end
  end
end