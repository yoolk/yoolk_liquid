module Yoolk
  module Liquid
    class InstantWebsite::PagesDrop < ::Liquid::Rails::CollectionDrop
      def primary
        # @primary ||= self.class.new(objects.select { |object| object.primary? }.take(6))
        @primary ||= self.class.new(objects.take(5))
      end

      def more
        # @more ||= self.class.new(objects.select { |object| !object.primary? }.drop(6))
        @more ||= self.class.new(objects.drop(5))
      end

      def more?
        more.select do |m|
          m.context = @context
          m.show?
        end.present?
      end
    end
  end
end