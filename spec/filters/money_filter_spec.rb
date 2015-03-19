require 'rails_helper'

module Yoolk
  module Liquid
    describe MoneyFilter do
      it "#money" do
        expect_template_result("{{ 12.04 | money }}", "$ 12.04")
      end

      it "#money_with_currency" do
        expect_template_result("{{ 12.04 | money_with_currency }}", "$ 12.04 USD")
      end
    end
  end
end