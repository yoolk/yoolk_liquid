module Yoolk
  module Liquid
    class FormTag < ::Liquid::Block
      def initialize(tag_name, markup, tokens)
         super
         @url = markup
      end
      def render(context)
        "<form accept-charset='UTF-8' method='post' #{@url}> <input name='form_type' type='hidden' value='customer_login' /><input name='utf8' type='hidden' value='✓' />" + super + "</form>"
      end
    end
  end
end

Liquid::Template.register_tag('form', Yoolk::Liquid::FormTag)