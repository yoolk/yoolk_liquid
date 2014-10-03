require 'rails_helper'

module Yoolk
  module Liquid
    describe AccountDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:first_name) }
      it { should have_attribute(:last_name) }
      it { should have_attribute(:full_name) }
      it { should have_attribute(:gender) }

      it { should belongs_to(:avatar).class_name('Yoolk::Liquid::AttachmentDrop') }
    end
  end
end