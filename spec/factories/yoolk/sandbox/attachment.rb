FactoryGirl.define do
  factory :attachment, class: Yoolk::Sandbox::Attachment do
    transient do
      width  nil
      height nil
    end

    attachment_meta {
      {
        "original": {
          "width":  width.to_i,
          "height": height.to_i
        }
      }
    }
  end
end