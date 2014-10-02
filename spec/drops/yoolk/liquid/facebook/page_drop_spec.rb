require 'rails_helper'

module Yoolk
  module Liquid
    describe Facebook::PageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:facebook_id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:link) }
      it { should have_attribute(:cover_photo_url) }
    end
  end
end