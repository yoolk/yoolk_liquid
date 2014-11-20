require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::CatalogItems do
      it { should respond_to(:published) }
    end
  end
end