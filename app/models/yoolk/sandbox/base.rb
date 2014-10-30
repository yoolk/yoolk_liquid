module Yoolk
  module Sandbox
    class Base
      include Virtus.model
      include ::Liquid::Rails::Droppable

      def self.drop_class
        class_name = self.name.gsub(/^Yoolk::Sandbox/, 'Yoolk::Liquid')
        "#{class_name}Drop".safe_constantize
      end

      def self.find(name)
        directory  = self.name.underscore.split('/').last.pluralize
        path       = Rails.root.join('db', 'samples', 'jsons', directory, "#{name}.json")
        return nil unless File.exists? path

        attributes = Oj.load(File.read(path))
        new(attributes)
      end
    end
  end
end