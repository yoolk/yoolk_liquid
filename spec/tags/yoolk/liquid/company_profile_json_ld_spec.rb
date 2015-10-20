require 'rails_helper'

module Yoolk
  module Liquid
    describe CompanyProfileJsonLd do
      context 'listing not found' do

        it 'render nil' do
          expect_template_result('{% company_profile_json_ld %}', nil, {})
        end
      end

      context 'listing found' do
        it 'render correct json ld format' do
          listing   = { 'listing' => build(:listing) }

          expected  = "<script type=\"application/ld+json\">render correct json ld format</script>"

          expect_template_result('{% company_profile_json_ld %}', expected, listing)
        end
      end
    end
  end
end
