module Yoolk
  module Liquid
    module Menu
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :uncategorized?, :to_param,
                    :created_at, :updated_at

        has_many    :foods, with: 'Yoolk::Liquid::Menu::FoodDrop'

        def foods_url
          menu_category_foods_url(self)
        end

        def current?
          @context.registers[:controller].params[:category_id].to_i == object.id
        end
      end
    end
  end
end