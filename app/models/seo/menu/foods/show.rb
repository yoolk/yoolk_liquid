class Seo::Menu::Foods::Show < Seo::Base

  def title
    "#{food.name} - #{listing.name}"
  end

  def description
    "#{food.description.to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip}"
  end

  def food
    object
  end

end
