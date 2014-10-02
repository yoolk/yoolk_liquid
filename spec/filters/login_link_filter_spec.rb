require 'rails_helper'

module Yoolk
  module Liquid
    describe LoginLinkFilter do
      before  { setup_view_and_controller }

      it '#login_link' do
        expect_template_result("{{ 'signin' | login_link }}", "<a class=\"office-account\" href=\"/office\">signin</a>")
      end

    end
  end
end