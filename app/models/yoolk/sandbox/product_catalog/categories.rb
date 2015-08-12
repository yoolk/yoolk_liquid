module Yoolk
  module Sandbox
    module ProductCatalog
      class Categories < Collection
        def defaults
          select { |category| !category.uncategorized? && category.products.present? }
        end
      end
    end
  end
end