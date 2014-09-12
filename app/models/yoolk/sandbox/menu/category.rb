module Yoolk
  module Sandbox
    module Menu
      class Category < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :name,                  String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :foods,                 Array[Yoolk::Sandbox::Menu::Food]

        def to_param
          "#{id}-#{name.parameterize}"
        end

      end
    end
  end
end