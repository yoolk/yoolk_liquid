module Yoolk
  module Liquid
    class InstantWebsite::PagesDrop < ::Liquid::Rails::CollectionDrop

      def primary
        @primary ||= viewable_pages.take(6)
      end

      def more
        @more ||= viewable_pages.drop(6)
      end

      def more?
        more.present?
      end

      private
      def viewable_pages
        self.class.new(objects).select do |page|
          page.context = @context
          page.show?
        end
      end
    end
  end
end