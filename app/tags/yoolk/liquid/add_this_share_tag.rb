module Yoolk
  module Liquid
    class AddThisShareTag < AddThisBaseTag

      def render(context)
        super context
      end

      def unknown_tag(name, params, tokens)
        super name, params, tokens
      end
    end
  end
end

Liquid::Template.register_tag('addthis_share', Yoolk::Liquid::AddThisShareTag)