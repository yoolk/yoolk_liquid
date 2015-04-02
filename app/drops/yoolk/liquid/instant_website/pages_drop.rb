module Yoolk
  module Liquid
    class InstantWebsite::PagesDrop < ::Liquid::Rails::CollectionDrop
      def primary
        @primary ||= self.class.new(objects.take(6))
      end

      def more
        @more ||= self.class.new(objects.drop(6))
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