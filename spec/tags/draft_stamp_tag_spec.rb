require 'rails_helper'

module Yoolk
  module Liquid
    describe DraftStampTag do
      before  { setup_view_and_controller }
      let(:context) { ::Liquid::Context.new({}, {}, { view: view, controller: controller }) }

      it '#draft_stamp_tag' do
        context["listing"] = {
          instant_website: {
            is_live: true
          }
        }
        ::Liquid::Template.parse('{% draft_stamp %}').render(context)
      end
      # 1. when instant is live
      # 2. when domain type is not subdomain
      # 3. when draft image is not pass
    end
  end
end