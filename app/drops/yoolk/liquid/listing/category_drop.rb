module Yoolk
  module Liquid
    class Listing::CategoryDrop < BaseDrop
      attributes  :id, :alias_id, :short_name, :name, :description,
                  :keyword, :display_on_web, :listings_count, :sub_categories_count, :level,
                  :created_at, :updated_at

      belongs_to  :short_description, class_name: 'Yoolk::Liquid::Listing::ShortDescriptionDrop'
    end
  end
end