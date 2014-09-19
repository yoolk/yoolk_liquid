module Yoolk
  module Liquid
    class CategoryDrop < BaseDrop
      attributes :id, :alias_id, :name, :short_name, :description, :keyword,
                 :display_on_web, :listings_count, :sub_categories_count, :level
    end
  end
end