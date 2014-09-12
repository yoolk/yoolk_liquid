require 'rails_helper'

module Yoolk
  module Liquid
    describe AttachmentDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:content_type) }
    end
  end
end