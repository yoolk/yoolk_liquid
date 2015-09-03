require 'rails_helper'

module Yoolk
  module Liquid
    describe DiscountBadgeFilter do
      let(:product) { Yoolk::Sandbox::ProductCatalog::Product.new(id: 211, name: 'evogue') }

      it 'not render when no discount_in_percentage' do
        expect_template_result('{{ nil | discount_badge }}', '', {'product'=> product})
      end

      it 'renders with default circle shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"circle-shape\" id=\"circle-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{{ '1 %' | discount_badge }}", expected, {'product'=> product})
      end

      it 'renders with circle shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"circle-shape\" id=\"circle-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{{ '1 %' | discount_badge: 'circle' }}", expected, {'product'=> product})
      end

      it 'renders with waterdrop shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"waterdrop-shape\" id=\"waterdrop-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{{ '1 %' | discount_badge: 'waterdrop' }}", expected, {'product'=> product})
      end

      it 'renders with rectangle shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"rectangle-shape\" id=\"rectangle-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{{ '1 %' | discount_badge: 'rectangle' }}", expected, {'product'=> product})
      end
    end
  end
end
