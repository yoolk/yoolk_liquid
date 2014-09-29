module Yoolk
  module Liquid
    class FormTag < ::Liquid::Block
      def initialize(tag_name, markup, tokens)
         super
         @url = markup
      end
      def render(context)
        @token ||= context.registers[:view].form_authenticity_token
        "<form accept-charset='UTF-8' method='post' #{@url}>
        <div style='margin:0;padding:0;display:inline'>
        <input name='utf8' type='hidden' value='✓'>
        <input name='authenticity_token' type='hidden' value='#{@token}'>
        </div>" + super + "</form>"
      end

    end
  end
end

Liquid::Template.register_tag('form', Yoolk::Liquid::FormTag)