module Yoolk
  module Sandbox
    class Attachment < Yoolk::Sandbox::Base

      attribute     :content_type,      String
      attribute     :attachment_meta,   Hash

    end
  end
end