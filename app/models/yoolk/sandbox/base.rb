module Yoolk
  module Sandbox
    class Base
      include Virtus.model
      include ::Liquid::Rails::Droppable

      def self.drop_class
        class_name = self.name.gsub(/^Yoolk::Sandbox/, 'Yoolk::Liquid')
        "#{class_name}Drop".safe_constantize
      end

      ## Load models from filename
      ## @params: name[String or Array]
      ## .find(1)
      ## => returns nil if not found
      ## .find(1,2), .find([1,2])
      ## => returns [] if not found
      ## .find([1])
      ## => returns [1]
      def self.find(names)
        if names.is_a?(Array)
          find_array(names)
        else
          find_item(names)
        end
      end

      def self.find_array(names)
        names.map { |name| find_item(name) }
      end

      def self.find_item(name)
        directory  = self.name.underscore.split('/').last.pluralize
        path       = Rails.root.join('db', 'samples', 'jsons', directory, "#{name}.json")
        return nil unless File.exists?(path)

        attributes = Oj.load(File.read(path))
        new(attributes)
      end

      private_class_method :find_array
      private_class_method :find_item

    end
  end
end