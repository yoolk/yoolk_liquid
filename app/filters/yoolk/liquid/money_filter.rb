module Yoolk
  module Liquid
    module MoneyFilter
      def money(money)
        return '' if money.nil?
        sprintf("$ %.2f", money)
      end

      def money_with_currency(money)
        return '' if money.nil?
        view.number_to_currency(money, unit: currency_code, format: "%u %n")
      end    
   
      def view   
        @context.registers[:view]
      end

      def currency_code
        @context['listing.currency.code']
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::MoneyFilter
