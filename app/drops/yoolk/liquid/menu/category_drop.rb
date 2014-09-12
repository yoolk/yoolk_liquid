module Yoolk
  module Liquid
    module Menu
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :to_param, :created_at, :updated_at

        has_many    :foods, with: 'Yoolk::Liquid::Menu::FoodDrop'

        def url
          menu_category_url(self)
        end
      end
    end
  end
end