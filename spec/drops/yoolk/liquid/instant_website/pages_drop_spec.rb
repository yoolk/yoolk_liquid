require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PagesDrop do
      it { should respond_to(:primary) }
      it { should respond_to(:more) }
      it { should respond_to(:more?) }
    end
  end
end