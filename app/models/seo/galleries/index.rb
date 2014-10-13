class Seo::Galleries::Index < Seo::Base

  def title
    "#{I18n.t(:'links.galleries')} - #{listing_name}"
  end

  def description
    "#{I18n.t(:'seo.photo_gallery_of')} #{listing.name}"
  end

end
