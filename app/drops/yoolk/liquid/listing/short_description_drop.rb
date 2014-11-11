module Yoolk
  module Liquid
    class Listing::ShortDescriptionDrop < BaseDrop
      attributes  :id, :text, :created_at, :updated_at

      has_many :categories,  with: 'Yoolk::Liquid::Listing::CategoryDrop'
    end
  end
end