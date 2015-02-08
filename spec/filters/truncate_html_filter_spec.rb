require 'rails_helper'

module Yoolk
  module Liquid
    describe TruncateHtmlFilter do
      let(:html) { '<ul><li><a href="http://whatever">This is a link</a></li></ul>' }

      it '#truncate_html' do
        expect_template_result("{{ '#{html}' | truncate_html: length: 20, omission: '...(continued)' }}", '<ul><li><a href="http://whatever">This...(continued)</a></li></ul>')
      end
    end
  end
end