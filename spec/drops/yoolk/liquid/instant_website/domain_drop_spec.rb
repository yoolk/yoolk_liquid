require 'rails_helper'

module Yoolk
  module Liquid
    module InstantWebsite
      describe DomainDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:url) }
        it { should have_attribute(:type) }
        it { should have_attribute(:google_analytics_key) }
        it { should have_attribute(:is_primary) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }
      end
    end
  end
end