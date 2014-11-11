module Yoolk
  module Sandbox
    class Listing::ShortDescription < Base
      attribute :id,            String
      attribute :text,          String

      attribute :categories,    Array[Yoolk::Sandbox::Category]
    end
  end
end