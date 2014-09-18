require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::PeopleDrop do
      it { should have_scope(:directors) }
      it { should have_scope(:managers) }
      it { should have_scope(:employees) }
    end
  end
end