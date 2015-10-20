require 'rails_helper'

module Yoolk
  module Liquid
    describe ProductJsonLd do
      context 'product not found' do

        it 'render nil' do
          expect_template_result('{% product_json_ld %}', nil, {})
        end
      end

      context 'product found' do
        it 'render correct json ld format' do
          product   = { 'product' => build(:product) }

          expected  = "<script type=\"application/ld+json\">render correct json ld format</script>"

          expect_template_result('{% product_json_ld %}', expected, product)
        end
      end
    end
  end
end
