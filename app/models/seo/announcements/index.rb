class Seo::Announcements::Index < Seo::Base
  def title
    "#{I18n.t(:'links.announcements')} - #{listing.name}"
  end
end
