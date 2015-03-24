module Yoolk
  module Liquid
    class InstantWebsite::PageLabelsDrop < ::Liquid::Rails::CollectionDrop
      scope :primary, :mores

      def mores?
        mores.select do |item|
          item.context = @context
          item.show?
        end
      end
    end
  end
end