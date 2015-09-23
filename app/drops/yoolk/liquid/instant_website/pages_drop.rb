module Yoolk
  module Liquid
    class InstantWebsite::PagesDrop < ::Liquid::Rails::CollectionDrop

      def primary
        @primary ||= viewable_pages.take(5)
      end

      def more
        @more ||= viewable_pages.drop(5)
      end

      def more?
        more.present?
      end

      def find_by(tp_name)
        self.detect do |page|
          page.context = @context
          page.template_page.send(:"#{tp_name.parameterize.underscore}?")
        end
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