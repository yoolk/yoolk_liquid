class Seo::Menu::Index < Seo::Base

  def title
    "Menu - #{listing.name}"
  end

  def description
    "Enjoy our menu set including #{food_names}."
  end

  private

  def food_names
    listing.foods.take(6).map(&:name).join(" , ")
  end
end
