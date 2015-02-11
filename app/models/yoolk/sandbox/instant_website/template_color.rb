module Yoolk
  module Sandbox
    module InstantWebsite
      class TemplateColor < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :name,                  String
        attribute :code,                  String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime
      end
    end
  end
end