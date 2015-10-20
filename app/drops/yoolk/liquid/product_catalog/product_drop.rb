module Yoolk
  module Liquid
    module ProductCatalog
      class ProductDrop < BaseDrop
        attributes  :id, :name, :price, :sale_price, :quantity, :price_with_currency,
                    :description, :delivery, :features, :brand, :to_param, :hide_price,
                    :hide_price?, :sku, :storefront, :published, :tracked_inventory,
                    :storefront_order, :selling_price, :in_stock?,
                    :out_of_stock?, :unlimited?,
                    :created_at, :updated_at

        has_many    :product_categories,  with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :photos,              with: 'Yoolk::Liquid::AttachmentDrop'

        ## Delegates
        delegate    :available_for_sale?, :unavailable_for_sale?, :to_json_ld,
                    :show_price?, :visible_price?, :discount_in_percentage, :cover_photo,
                    to: :object

        def url
          product_url(self)
        end

        def add_to_cart?
          object.add_to_cart? && !@context['request.preview_mode?']
        end
      end
    end
  end
end
