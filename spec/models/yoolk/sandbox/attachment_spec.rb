require 'rails_helper'

module Yoolk
  module Sandbox
    describe Attachment do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :content_type attribute' do
        expect(described_class).to have_attribute(:content_type).of_type(String)
      end

      it 'has :attachment_meta attribute' do
        expect(described_class).to have_attribute(:attachment_meta).of_type(Hash)
      end

      it { should respond_to(:width) }
      it { should respond_to(:height) }
      it { should respond_to(:size) }
      it { should respond_to(:url) }
    end
  end
end