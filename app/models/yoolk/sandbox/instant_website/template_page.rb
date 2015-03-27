module Yoolk
  module Sandbox
    module InstantWebsite
      class TemplatePage < Yoolk::Sandbox::Base

        attribute :id,               String
        attribute :name,             String
        attribute :display_order,    Integer
        attribute :created_at,       DateTime
        attribute :updated_at,       DateTime
      end
    end
  end
end