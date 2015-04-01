module Yoolk
  module Liquid
    class InstantWebsite::PagesDrop < ::Liquid::Rails::CollectionDrop
      def primary
        @primary ||= self.class.new(objects.select { |object| object.primary? }.take(6))
      end

      def more
        @more ||= self.class.new(objects.select { |object| !object.primary? }.drop(6))
      end

      def more?
        more.select { |m| m.show? }.present?
      end
    end
  end
end