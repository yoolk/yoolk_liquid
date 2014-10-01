module Yoolk
  module Liquid
    class Facebook::PageDrop < BaseDrop
      attributes  :id, :page_id, :page_url, :page_name, :page_access_token,
                  :cover_photo_url, :installed_page_ids, :photo_uploaded_status,
                  :is_published, :last_photo_uploaded_at

    end
  end
end