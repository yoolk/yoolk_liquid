module Yoolk
  module Liquid
    module Menu
      class FoodDrop < BaseDrop
        attributes  :id, :name, :description, :delivery, :properties,
                    :to_param, :created_at, :updated_at

        belongs_to  :category,  class_name: 'Yoolk::Liquid::Menu::CategoryDrop'
        has_many    :photos,    with: 'Yoolk::Liquid::AttachmentDrop'

        def url
          menu_food_url(self)
        end

        def cover_photo
          photos[0]
        end
      end
    end
  end
end