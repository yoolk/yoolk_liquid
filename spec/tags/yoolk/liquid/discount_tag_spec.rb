require 'rails_helper'

module Yoolk
  module Liquid
    describe DiscountTag do
      let(:product) { Yoolk::Sandbox::ProductCatalog::Product.new(id: 211, name: 'evogue') }

      it '#discount tag not render when no discount_in_percentage' do
        expect_template_result('{% discount %}', '', {'product'=> product})
      end

      it '#discount tag render with default circle shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"circle-shape\" id=\"circle-shape\">1 % <small>OFF</small></span>"

        expect_template_result('{% discount %}', expected, {'product'=> product})
      end

      it '#discount tag render with circle shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"circle-shape\" id=\"circle-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{% discount shape = 'circle' %}", expected, {'product'=> product})
      end

      it '#discount tag render with waterdrop shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"waterdrop-shape\" id=\"waterdrop-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{% discount shape = 'waterdrop' %}", expected, {'product'=> product})
      end

      it '#discount tag render with rectangle shape' do
        allow(product).to receive(:discount_in_percentage).and_return('1 %')
        expected = "<span class=\"rectangle-shape\" id=\"rectangle-shape\">1 % <small>OFF</small></span>"

        expect_template_result("{% discount shape = 'rectangle' %}", expected, {'product'=> product})
      end

      it 'raises error for unvailable shape' do
        expect {
          ::Liquid::Template.parse("{% discount shape = 'rectangle1' %}")
        }.to raise_error
      end
    end
  end
end