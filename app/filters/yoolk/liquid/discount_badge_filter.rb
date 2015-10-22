module Yoolk
  module Liquid
    module DiscountBadgeFilter

      # Generate HTML discount badge for template.
      # @param [ value ] float
      # @param [ shape_name ] : [circle, waterdrop, rectangle]
      def discount_badge(value, shape_name='circle')
        return if value.blank? || value == '0%'
        
        %Q{
          <span class="#{shape_name}-shape">
            #{value} <small>OFF</small>
          </span>
        }.gsub(/^\s+|$\n/, '')
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::DiscountBadgeFilter
