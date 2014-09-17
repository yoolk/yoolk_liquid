module Yoolk
  module Sandbox
    class Category < Yoolk::Sandbox::Base

      attribute :id,                     String
      attribute :alias_id,               String
      attribute :name,                   String
      attribute :short_name,             String
      attribute :description,            String
      attribute :keyword,                String
      attribute :display_on_web,         Boolean
      attribute :listings_count,         Integer
      attribute :sub_categories_count,   Integer
      attribute :level,                  Integer

    end
  end
end