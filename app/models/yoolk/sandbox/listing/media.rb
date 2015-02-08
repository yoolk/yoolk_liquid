module Yoolk
  module Sandbox
    class Listing::Media < Yoolk::Sandbox::Base

      attribute :id,                String
      attribute :embed_script,      String
      attribute :is_active,         Boolean
      attribute :title,             String
      attribute :created_at,        DateTime
      attribute :updated_at,        DateTime
    end
  end
end