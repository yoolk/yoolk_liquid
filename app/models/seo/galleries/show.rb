class Seo::Galleries::Show < Seo::Base
  include ActionView::Helpers::TextHelper

  def title
    "#{album.name} - #{listing_name}"
  end

  def description
    "#{pluralize(album.gallery_images.count, 'photo')} of #{album.name}"
  end

  def album
    object
  end
end
