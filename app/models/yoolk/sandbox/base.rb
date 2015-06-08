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
      def self.find(names)
        directory  = self.name.underscore.split('/').last.pluralize
        instances  = []
        names      = Array.wrap(names)

        names.each do |name|
          path       = Rails.root.join('db', 'samples', 'jsons', directory, "#{name}.json")
          return nil unless File.exists?(path)

          attributes = Oj.load(File.read(path))
          instances << new(attributes)
        end

        (instances.length == 1) ? instances.first : instances
      end
    end
  end
end