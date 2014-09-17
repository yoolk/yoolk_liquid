module Yoolk
  module Liquid
    class Listing::CommunicationDrop < BaseDrop
      attributes :id, :type, :label, :value, :is_first_line, :image_url, :created_at, :updated_at
    end
  end
end