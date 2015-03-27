module Yoolk
  module Liquid
    class InstantWebsite::PagesDrop < ::Liquid::Rails::CollectionDrop
      scope :primary, :more

      def more?
        more.select do |item|
          item.context = @context
          item.show?
        end.present?
      end
    end
  end
end