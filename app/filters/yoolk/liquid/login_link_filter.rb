module Yoolk
  module Liquid
    module LoginLinkFilter

      def login_link(text)
        if @context.registers[:controller].params[:login].present?
          link_to image_tag(asset_path('sample/male-office.png'), class: "office-img").safe_concat("My Office"), "/office/signin", class: "office-account"
        else
          link_to text, "/office", class: "office-account"
        end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::LoginLinkFilter