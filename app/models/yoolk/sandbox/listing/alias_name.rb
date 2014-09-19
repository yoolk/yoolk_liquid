module Yoolk
  module Sandbox
    class Listing::AliasName < Yoolk::Sandbox::Base

      attribute :id,          String
      attribute :name,        String
      attribute :type,        String
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end
