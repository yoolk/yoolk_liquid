module Yoolk
  module Sandbox
    class Listing::Link < Yoolk::Sandbox::Base

      attribute :id,          String
      attribute :title,       String
      attribute :link,        String
      attribute :description, String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end