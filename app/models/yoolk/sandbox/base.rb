module Yoolk
  module Sandbox
    class Base
      include Virtus.model
      include ::Liquid::Rails::Droppable

      def self.drop_class
        class_name = self.name.gsub(/^Yoolk::Sandbox/, 'Yoolk::Liquid')
        "#{class_name}Drop".safe_constantize
      end
    end
  end
end