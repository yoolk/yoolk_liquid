require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageLabelsDrop do
      it { should have_scope(:primary) }
      it { should have_scope(:more) }
      it { should respond_to(:more?) }
    end
    describe InstantWebsite::PageLabelsDrop, :focus do
      let(:request) { Yoolk::Liquid::RequestDrop.new }
      let(:more)    { binding.pry }

      it 'return true when in preview mode or at least one object of collection more is not empty' do
        h = {
            name: "About Us",
            template_page: {
              name: "About Us",
              display_order: 1
            }
          }
        Yoolk::Sandbox::InstantWebsite::PageLabel.new(h)

        # communication.type  = 'Branch Office'
        # communication.label = 'Yellow Tower - Siem Reap'

        # expect(subject.li).to eq('<span>Yellow Tower - Siem Reap</span>')
      end

      it 'return false when all objects in collection more are empty and not in preview mode'  do
      end
    end
  end
end