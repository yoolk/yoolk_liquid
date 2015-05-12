require 'rails_helper'

module Yoolk
  module Liquid
    describe GoogleRemarketingTag do
      let(:listing) { build(:listing, :instant_website, google_remarketing_tag: "<script>echo('google')</script>") }

      it 'render google_remarketing_tag' do
        expect_template_result('{% google_remarketing_tag %}', listing.instant_website.google_remarketing_tag, { 'listing'=> listing, 'request'=> {'preview_mode?'=>false} })
      end

      context "doesn't render" do
        it 'in preview_mode' do
          expect_template_result('{% google_remarketing_tag %}', nil, { 'listing'=> listing, 'request'=> {'preview_mode?'=>true} })
        end

        it 'no instant_website' do
          listing.instant_website = nil
          expect_template_result('{% google_remarketing_tag %}', nil, { 'listing'=> listing, 'request'=> {'preview_mode?'=>false} })
        end
      end
    end
  end
end
