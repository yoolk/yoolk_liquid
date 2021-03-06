require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::ExtraCommunicationsDrop do
      it { should have_scope(:telephones) }
      it { should have_scope(:emails) }
      it { should have_scope(:websites) }
    end
  end
end