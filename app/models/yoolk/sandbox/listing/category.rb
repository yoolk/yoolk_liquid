module Yoolk
  module Sandbox
    class Listing::Category < Base

      attribute :id,                    String
      attribute :alias_id,              String
      attribute :name,                  String
      attribute :short_name,            String
      attribute :keyword,               String
      attribute :description,           String
      attribute :display_on_web,        Boolean
      attribute :listings_count,        Integer
      attribute :sub_categories_count,  Integer
      attribute :level,                 Integer

      attribute :short_description,     Yoolk::Sandbox::Listing::ShortDescription
    end
  end
end