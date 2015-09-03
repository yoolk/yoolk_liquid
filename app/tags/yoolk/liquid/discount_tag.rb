### Render discount badge for ecommerce products
  # @Usage: {% discount shape = 'waterdrop' %}  # DEFAULT: `circle`

  # @params: 3 possible params :
  #          - circle
  #          - waterdrop
  #          - rectangle

  # NOTE : You have manually parent position to relative.
  # Example:
  #     <div class="parent-elem" style="position: relative">
  #       {% discount shape = 'circle' %}
  #     </div>

module Yoolk
  module Liquid
    class DiscountTag < ::Liquid::Tag
      Shapes = ['circle', 'waterdrop', 'rectangle']
      Syntax = /(shape.*[^\%\}]'([^']*)')/

      def initialize(tag_name, markup, options)
        super

        if markup =~ Syntax
          @shape_name = $2

          unless @shape_name.in?(Shapes)
            raise ArgumentError, "valid `shape` parameter for discount tag are: #{ Shapes.to_sentence }"
          end
        elsif markup.blank?
          @shape_name = 'circle'
        else
          raise SyntaxError.new("Syntax Error - Valid syntax: {% discount shape = 'circle' %}")
        end
      end

      def render(context)
        discount_price = context["product.discount_in_percentage"]

        %Q{
          <span class="#{@shape_name}-shape" id="#{@shape_name}-shape">
            #{discount_price} <small>OFF</small>
          </span>
        }.gsub(/^\s+|$\n/, '') if discount_price.present?
      end
    end
  end
end

Liquid::Template.register_tag('discount', Yoolk::Liquid::DiscountTag)
