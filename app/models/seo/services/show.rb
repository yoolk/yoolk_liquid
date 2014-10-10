class Seo::Services::Show < Seo::Base

  def title
    "#{service.name} - #{listing.name}"
  end

  def description
    "#{service.description.to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip}"
  end

  def service
    object
  end

end
