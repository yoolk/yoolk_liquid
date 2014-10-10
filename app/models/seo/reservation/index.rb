class Seo::Reservation::Index < Seo::Base

  def title
    "Reservation - #{listing.name}"
  end

  def description
   "Book a room for your accommodation at #{listing.name} in #{location_name} by phone: #{phone_number} or via email: #{email_address}"
  end

end
