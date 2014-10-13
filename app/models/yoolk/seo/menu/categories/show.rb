module Yoolk
  module Seo
    module Menu
      class Categories::Show < Yoolk::Seo::Base
        def title
          "#{food_category.name} - #{listing_name}"
        end
        def description
          "#{listing_name} serves #{food_category.name} like #{food_names}."
        end
        def food_names
          food_category.foods.take(6).map(&:name).join(", ")
        end
        def food_category
          object
        end
      end
    end
  end
end