module Yoolk
  module Sandbox
    class Location < Base

      attribute :id,            String
      attribute :alias_id,      String
      attribute :name,          String
      attribute :priority,      Integer
      attribute :show_on_web,   Boolean
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime

    end
  end
end