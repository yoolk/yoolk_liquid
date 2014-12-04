module Yoolk
  module Liquid
    module ArrayFilter

      def group_by(array, field)
        array.group_by { |item| item.public_send(field) }
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::ArrayFilter