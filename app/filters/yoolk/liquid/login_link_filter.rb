module Yoolk
  module Liquid
    module LoginLinkFilter

      def login_link(text)

        if @context.registers[:controller].params[:login].present?
          link_to image_tag(asset_path('sample/male-office.png'), class: "office-img").safe_concat("My Office"), nil, class: "office-account"
          # link_to "/office/signin", {class: "office-account"} do
          #   "my office"#image_tag(asset_url('sample/male-office.png'), class: "office-img").safe_concat("My Office")
          # end
        else
          link_to "signin", "/office", class: "office-account"
        end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::LoginLinkFilter