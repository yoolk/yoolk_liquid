require 'rails_helper'

module Yoolk
  module Liquid
    describe AutoLinkFilter do
      let(:html) { 'Go to http://www.rubyonrails.org and say hello to david@loudthinking.com' }

      it '#auto_link' do
        expect_template_result("{{ '#{html}' | auto_link }}", "Go to <a href=\"http://www.rubyonrails.org\">http://www.rubyonrails.org</a> and say hello to <a href=\"mailto:david@loudthinking.com\">david@loudthinking.com</a>")
      end

      it '#auto_link with email' do
        expect_template_result("{{ '#{html}' | auto_link: 'email_addresses' }}", "Go to http://www.rubyonrails.org and say hello to <a href=\"mailto:david@loudthinking.com\">david@loudthinking.com</a>")
      end

      it '#auto_link with url' do
        expect_template_result("{{ '#{html}' | auto_link: 'urls' }}", "Go to <a href=\"http://www.rubyonrails.org\">http://www.rubyonrails.org</a> and say hello to david@loudthinking.com")
      end
    end
  end
end