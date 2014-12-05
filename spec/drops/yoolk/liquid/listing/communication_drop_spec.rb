require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CommunicationDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:type) }
      it { should have_attribute(:label) }
      it { should have_attribute(:value) }
      it { should have_attribute(:is_first_line) }
      it { should have_attribute(:image_url) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should respond_to(:li) }
      it { should respond_to(:value_with_http) }
      it { should respond_to(:communication) }

    end

    describe Listing::CommunicationDrop, "view" do

      let(:communication_drop)   { described_class.new(Yoolk::Sandbox::Listing::Communication.new(type: "Branch Office", value: "Yellow Tower - Siem Reap")) }

      before do
        communication_drop.context = context
      end

      it { communication_drop.li }

    end
  end
end