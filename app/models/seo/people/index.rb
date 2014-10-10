class Seo::People::Index < Seo::Base

  def title
    "People - #{listing.name}"
  end

  def description
    "Public contact information of people who work for #{listing.name} that may want to contact by phone number or email address."
  end

end
