class Seo::Products::Categories::Show < Seo::Base

  def title
    "#{product_category.name} - #{listing.name}"
  end

  def description
    "#{product_category.name}: #{product_names}"
  end

  private

  def product_names
    product_category.products.take(6).map(&:name).join(" , ")
  end

  def product_category
    object
  end
end
