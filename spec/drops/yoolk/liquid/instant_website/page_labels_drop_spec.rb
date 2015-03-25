require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageLabelsDrop do
      it { should have_scope(:primary) }
      it { should have_scope(:more) }
      it { should respond_to(:more?) }
    end
  end
end