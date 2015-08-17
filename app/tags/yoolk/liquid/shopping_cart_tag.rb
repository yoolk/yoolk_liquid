module Yoolk
  module Liquid
    class ShoppingCartTag < ::Liquid::Tag
      def initialize(tag_name, max, tokens)
         super

         @ecommerce_locales = {
            shopping_cart: I18n.t(:'ecommerce.shopping_cart'),
            subtotal: I18n.t(:'ecommerce.subtotal'),
            checkout: I18n.t(:'ecommerce.checkout'),
            empty_cart: I18n.t(:'ecommerce.empty_cart')
         }
      end

      def render(context)
        @context = context

        if context['listing.shopping_cart?']
          %Q{
            <div class="js-shopping-cart shopping-cart-icon" data-ecommerce-locales='#{@ecommerce_locales.to_json}' data-checkout-url='/checkout/new'>
              <div class="shop-badge">
                <i class="fa fa-shopping-cart"></i>
                <span id="total-items" class="badge"></span>
              </div>
              <div id="shopping-cart-list"></div>
            </div>
          }
        end
      end

      def csrf_token
        @context.registers[:view].form_authenticity_token
      end
    end
  end
end

Liquid::Template.register_tag('shopping_cart', Yoolk::Liquid::ShoppingCartTag)