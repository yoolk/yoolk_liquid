class Seo::Brochures::Index < Seo::Base

  def title
    "#{I18n.t(:'links.brochures')} - #{listing_name}"
  end

  def description
    "#{I18n.t(:'seo.brochures_of')} #{listing_name}"
  end

  private

  def brochures_names
    listing.artworks.take(6).map(&:name).join(" , ")
  end

end