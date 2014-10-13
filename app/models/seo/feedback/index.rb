class Seo::Feedback::Index < Seo::Base

  def title
    "#{I18n.t(:'links.feedback')} - #{listing.name}"
  end

  def description
    I18n.t(:'feedback.quote')
  end

end
