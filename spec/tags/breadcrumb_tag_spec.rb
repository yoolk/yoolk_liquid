require 'rails_helper'

module Yoolk
  module Liquid
    describe BreadcrumbTag do
      let(:request_drop) { RequestDrop.new }

      before do
        context.registers[:view].class.send :include, Rails.application.routes.url_helpers
        request_drop.context = context
      end

      it '#breadcrumb renders inside /map' do
        allow(request_drop).to receive(:map_url?).and_return(true)

        expect_template_result('{% breadcrumb %}', '', { 'request' => request_drop })
      end
    end
  end
end