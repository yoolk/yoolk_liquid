module Yoolk
  module Sandbox
    module Menu
      class Food < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :name,                  String
        attribute :price,                 Float
        attribute :description,           String
        attribute :delivery,              Boolean
        attribute :properties,            Array
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :photos,                Array[Yoolk::Sandbox::Attachment]
        attribute :category,              Yoolk::Sandbox::Menu::Category

        def to_param
          "#{id}-#{name.parameterize}"
        end

      end
    end
  end
end