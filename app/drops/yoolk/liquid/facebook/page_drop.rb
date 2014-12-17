module Yoolk
  module Liquid
    module Facebook
      class PageDrop < BaseDrop
        attributes  :id, :facebook_id, :page_name, :url, :cover_photo_url

        def facebook_id
          object.page_id
        end

        def name
          object.page_name
        end

        def url
          object.page_url
        end
      end
    end
  end
end