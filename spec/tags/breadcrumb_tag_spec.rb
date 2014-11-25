require 'rails_helper'

module Yoolk
  module Liquid
    describe BreadcrumbTag do
      let(:request_drop) { RequestDrop.new }

      before do
        request_drop.context = context
      end

      it '#breadcrumb renders inside /map' do
        allow(request_drop).to receive(:map_url?).and_return(true)
        map_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Map</li></ol>'

        expect_template_result('{% breadcrumb %}', map_list, { 'request' => request_drop })
      end
    end
  end
end