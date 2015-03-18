module Yoolk
  module Liquid
    module MoneyFilter
      def money(money)
        return '' if money.nil?
        sprintf("$%.2f", money)
      end

      def money_with_currency(money)
        return '' if money.nil?
        sprintf("USD %.2f", money)
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::MoneyFilter