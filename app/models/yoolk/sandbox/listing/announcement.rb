module Yoolk
  module Sandbox
    class Listing::Announcement < Yoolk::Sandbox::Base

      attribute :id,          Integer
      attribute :text,        String
      attribute :image,       Hash
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime

    end
  end
end
