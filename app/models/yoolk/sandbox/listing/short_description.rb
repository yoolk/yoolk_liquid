module Yoolk
  module Sandbox
    class Listing::ShortDescription < Base
      attribute :id,            String
      attribute :text,          String

      attribute :categories,    Array[Yoolk::Sandbox::Listing::Category]
    end
  end
end