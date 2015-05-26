module Yoolk
  module Liquid
    class PortalDrop < BaseDrop
      attributes  :id, :abbreviation, :domain_name, :description, :official_name,
                  :keywords, :time_zone, :created_at, :updated_at

      belongs_to :country,        with: 'Yoolk::Liquid::CountryDrop'
      belongs_to :language,       with: 'Yoolk::Liquid::LanguageDrop'

    end
  end
end

