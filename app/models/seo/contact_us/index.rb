class Seo::ContactUs::Index < Seo::Base

  def title
    "#{I18n.t(:'links.contact_us')} - #{listing.name}"
  end

  def description
   "#{I18n.t(:'seo.contact_info')} #{I18n.t(:'global.phone')}: #{phone_number}, #{I18n.t(:'contact_us.email')}: #{email_address} #{I18n.t(:'seo.visit_address')}: #{listing.address}"
  end

end
