module Yoolk
  module Liquid
    class CompanyProfileJsonLd < ::Liquid::Tag
      def render(context)
        %Q{<script type="application/ld+json">#{context['listing.to_json_ld']}</script>} if context['listing'].present?
      end
    end
  end
end

Liquid::Template.register_tag('company_profile_json_ld', Yoolk::Liquid::CompanyProfileJsonLd)

