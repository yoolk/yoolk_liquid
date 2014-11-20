require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Artworks do
      it { should respond_to(:actives) }
    end
  end
end