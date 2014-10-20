module Yoolk
  module Sandbox
    class Listing::OpeningHour < Yoolk::Sandbox::Base

      attribute :id,          String
      attribute :day,         Integer
      attribute :open,        Yoolk::Sandbox::Hour
      attribute :close,       Yoolk::Sandbox::Hour
      attribute :created_at,  DateTime
      attribute :updated_at,  DateTime
    end
  end
end
