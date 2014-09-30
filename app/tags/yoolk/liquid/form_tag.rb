module Yoolk
  module Liquid
    class FormTag < ::Liquid::Block
      Syntax = /(#{::Liquid::VariableSignature}+)/

      def initialize(tag_name, markup, options)
        super

        if markup =~ Syntax
          @variable_name = $1
        else
          raise SyntaxError.new("Syntax Error - Valid syntax: {% form contact %}")
        end
      end

      def render(context)
        @csrf_token  = context.registers[:view].form_authenticity_token
        @flash       = context.registers[:view].flash[:notice]
        context.stack do
          context['form'] = {
            'errors' => @flash
          }
          form_builder(render_all(@nodelist, context))
        end
      end

      def form_builder(input)
        %Q{
          <form accept-charset='UTF-8' method='post' class='contact-form' id='contact-form' action=''>
            <div style='margin:0;padding:0;display:inline'>
              <input name='utf8' type='hidden' value='✓'>
              <input name='authenticity_token' type='hidden' value='#{@csrf_token}'>
            </div>
            #{input}
          </form>
        }
      end

    end
  end
end

Liquid::Template.register_tag('form', Yoolk::Liquid::FormTag)