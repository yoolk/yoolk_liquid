module Yoolk
  module Sandbox
    class App < Base

      attribute :id,                    String
      attribute :name,                  String
      attribute :created_at,            DateTime
      attribute :updated_at,            DateTime
    end
  end
end