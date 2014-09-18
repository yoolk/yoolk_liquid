require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::People do
      it { should respond_to(:directors) }
      it { should respond_to(:managers) }
      it { should respond_to(:employees) }
    end
  end
end