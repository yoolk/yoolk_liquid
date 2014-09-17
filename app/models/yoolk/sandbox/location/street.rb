module Yoolk
  module Sandbox
    class Location::Street < Yoolk::Sandbox::Base

      attribute :id,                String
      attribute :name,              String
      attribute :completed_at,      DateTime
      attribute :listings_count,    Integer
    end
  end
end