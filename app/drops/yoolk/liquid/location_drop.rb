module Yoolk
  module Liquid
    class LocationDrop < BaseDrop
      attributes  :id, :alias_id, :name, :priority, :show_on_web,
                  :created_at, :updated_at
    end
  end
end