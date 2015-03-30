require 'rails_helper'

module Yoolk
  module Sandbox
    describe InstantWebsite::Pages do
      it { should respond_to(:primary) }
      it { should respond_to(:more) }
    end
  end
end