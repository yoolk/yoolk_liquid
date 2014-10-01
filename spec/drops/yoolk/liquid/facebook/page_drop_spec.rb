require 'rails_helper'

module Yoolk
  module Liquid
    describe Facebook::PageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:page_id) }
      it { should have_attribute(:page_url) }
      it { should have_attribute(:page_name) }
      it { should have_attribute(:page_access_token) }
      it { should have_attribute(:cover_photo_url) }
      it { should have_attribute(:installed_page_ids) }
      it { should have_attribute(:photo_uploaded_status) }
      it { should have_attribute(:is_published) }
      it { should have_attribute(:last_photo_uploaded_at) }

    end
  end
end