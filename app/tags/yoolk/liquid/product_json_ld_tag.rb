module Yoolk
  module Liquid
    class ProductJsonLd < ::Liquid::Tag
      def render(context)
        %Q{<script type="application/ld+json">#{context['product.to_json_ld']}</script>} if context['product'].present?
      end
    end
  end
end

Liquid::Template.register_tag('product_json_ld', Yoolk::Liquid::ProductJsonLd)

