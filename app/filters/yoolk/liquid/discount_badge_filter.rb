module Yoolk
  module Liquid
    module DiscountBadgeFilter

      # Generate HTML discount badge for template.
      # @param [ value ] float
      # @param [ shape_name ] : [circle, waterdrop, rectangle]
      def discount_badge(value, shape_name='circle')
        %Q{
          <span class="#{shape_name}-shape" id="#{shape_name}-shape">
            #{value} <small>OFF</small>
          </span>
        }.gsub(/^\s+|$\n/, '') if value.present?
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::DiscountBadgeFilter