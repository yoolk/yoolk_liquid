class Seo::Services::Index < Seo::Base

  def title
    "Services - #{listing_name}"
  end

  def description
    "#{listing_name} offers various services such as #{service_names}"
  end

  private

  def service_names
    listing.services.take(6).map(&:name).join(" , ")
  end

end
