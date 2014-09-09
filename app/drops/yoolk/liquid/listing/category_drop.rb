module Yoolk
  module Liquid
    class Listing::CategoryDrop < BaseDrop
      attributes  :id, :alias_id, :short_name, :name, :description,
                  :keyword, :display_on_web, :listings_count, :sub_categories_count, :level

      belongs_to  :short_description, class_name: 'Yoolk::Liquid::Listing::ShortDescription'
    end
  end
end