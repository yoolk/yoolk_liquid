module Yoolk
  module Liquid
    module Menu
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :to_param, :created_at, :updated_at

        has_many    :foods, with: 'Yoolk::Liquid::Menu::FoodDrop'

        def url
          menu_category_url(self)
        end

        def current?
          @context.registers[:controller].params[:category_id].to_i == object.id
        end

        def uncategorized?
          name == 'Uncategorized'
        end
      end
    end
  end
end