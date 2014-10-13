class Seo::Menu::Categories::Show < Seo::Base

  def title
    "#{food_category.name} - #{listing_name}"
  end

  def description
    "#{listing_name} serves #{food_category.name} like #{food_names}."
  end

  def food_names
    food_category.foods.take(6).map(&:name).join(" , ")
  end

  def food_category
    object
  end

end
