module Yoolk
  module Sandbox
    module Menu
      class Category < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :name,                  String
        attribute :display_order,         Integer
        attribute :foods_count,           Integer
        attribute :food_ids,              Array
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :listing,               Yoolk::Sandbox::Listing

        def uncategorized?
          name == 'Uncategorized'
        end

        def foods
          @foods ||= begin
            foods = Yoolk::Sandbox::Menu::Food.find(food_ids)
            foods.each do |food|
              food.category = self
              food.listing = listing
            end
          end
        end

        def to_param
          "#{id}-#{name.parameterize}"
        end
      end
    end
  end
end