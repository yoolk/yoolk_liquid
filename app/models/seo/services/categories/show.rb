class Seo::Services::Categories::Show < Seo::Base

  def title
    "#{service_category.name} - #{listing_name}"
  end

  def description
    "Specialised in #{service_category.name}, #{listing_name} offers services such as #{service_names}"
  end

  private

  def service_names
    service_category.services.take(6).map(&:name).join(" , ")
  end

  def service_category
    object
  end

end
