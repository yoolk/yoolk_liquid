module Yoolk
  module Sandbox
    class Base
      include Virtus.model
      include ::Liquid::Rails::Droppable

      def read_attribute_for_serialization(name)
        attributes[name]
      end

      def to_liquid
        class_name = self.class.name.gsub(/^Yoolk::Sandbox/, 'Yoolk::Liquid')
        "#{class_name}Drop".safe_constantize.dropify(self)
      end
    end
  end
end