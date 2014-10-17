module Yoolk
  module Seo
    module Menu
      class Foods::Show < Yoolk::Seo::Base
        def title
          "#{food.name} - #{listing.name}"
        end

        def description
          "#{food.description.to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip}"
        end

        def food
          object
        end
      end
    end
  end
end