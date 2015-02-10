require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::TemplateDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:display_name) }
      it { should have_attribute(:description) }
      it { should have_attribute(:developer_url) }
      it { should have_attribute(:developed_by) }
      it { should have_attribute(:demo_website) }
      it { should have_attribute(:is_responsive) }
      it { should have_attribute(:industries) }
      it { should have_attribute(:pages) }
      it { should have_attribute(:colors) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:thumbnail).with('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:cover_photo).with('Yoolk::Liquid::InstantWebsite::TemplateCoverPhotoDrop') }
    end
  end
end