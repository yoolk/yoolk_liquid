module Yoolk
  module Liquid
    class FormTag < ::Liquid::Block
      Syntax = /(#{::Liquid::VariableSignature}+)/

      def initialize(tag_name, markup, options)
        super

        if markup =~ Syntax
          @variable_name = $1
          unless @variable_name.in?(['contact', 'feedback', 'reservation'])
            raise ArgumentError, 'valid parameters for form tag are: contact, feedback, and reservation'
          end
        else
          raise SyntaxError.new("Syntax Error - Valid syntax: {% form 'contact' %}")
        end
      end

      def render(context)
        @context = context
        @object  = context[@variable_name]

        context.stack do
          context['form'] = {
            'posted_successfully?' => @object.errors.blank? && flash.present?,
            'errors' => @object.errors.blank? ? nil : ActiveModel::ErrorsDrop.new(@object.errors)
          }
          @object.attributes.each do |field, message|
            context['form'][field.to_s] = message
          end

          form_builder(render_all(@nodelist, context))
        end
      end

      def form_builder(input)
        %Q{
          <form accept-charset='UTF-8' method='post' class='#{class_name}' id='#{class_name}' action='#{action_path}'>
            <div style='margin:0;padding:0;display:inline'>
              <input name='utf8' type='hidden' value='✓'>
              <input name='authenticity_token' type='hidden' value='#{csrf_token}'>
            </div>
            #{input}
          </form>
        }
      end

      private

        def action_path
          if @object.is_a?(Yoolk::Form::Contact)
            @context.registers[:controller].contact_us_path
          elsif @object.is_a?(Yoolk::Form::Feedback)
            @context.registers[:controller].feedback_index_path
          elsif @object.is_a?(Yoolk::Form::Reservation)
            @context.registers[:controller].reservation_index_path
          end
        end

        def class_name
          if @object.is_a?(Yoolk::Form::Contact)
            'comment-form'
          elsif @object.is_a?(Yoolk::Form::Feedback)
            'feedback-form'
          elsif @object.is_a?(Yoolk::Form::Reservation)
            'reservation-form'
          end
        end

        def csrf_token
          @context.registers[:view].form_authenticity_token
        end

        def flash
          @context.registers[:view].flash
        end
    end
  end
end

Liquid::Template.register_tag('form', Yoolk::Liquid::FormTag)