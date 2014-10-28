module Yoolk
  module Liquid
    module InstantWebsite
      class DomainDrop < BaseDrop
        attributes  :id, :name, :url, :type, :google_analytics_key, :is_primary,
                    :created_at, :updated_at
      end
    end
  end
end