require 'rails_helper'

module Yoolk
  module Liquid
    describe DraftStampTag do

      it '#draft_stamp_tag not render when instant is live' do
        expect_template_result('{% draft_stamp %}', '', {'listing'=>{'instant_website'=>{'is_live'=>true}}})
      end

      it '#draft_stamp_tag render default draft image when instant_website is not live and is not subdomain' do
        listing = {
                    'listing'=> {
                      'instant_website'=> {
                        'is_live'=>false,
                        'domains'=> [{
                          'type'=> 'pointed',
                          'name'=> 'test.host'
                        }]
                      }
                    }
                  }

        expected_result = "<img alt=\"Draft\" src=\"http://test.host/draft.png\" style=\"position: absolute; top: 0; right: 0; z-index: 9999;\" />"
        expect_template_result('{% draft_stamp %}', expected_result, listing)
      end

      it '#draft_stamp_tag not render when instant_website is not live and type is subdomain' do
        listing = {
                    'listing'=> {
                      'instant_website'=> {
                        'is_live'=>false,
                        'domains'=> [{
                          'type'=> 'subdomain',
                          'name'=> 'test.host'
                        }]
                      }
                    }
                  }

        expect_template_result('{% draft_stamp %}', '', listing)
      end

      it '#draft_stamp_tag with custom file' do
        listing = {
                    'listing'=> {
                      'instant_website'=> {
                        'is_live'=>false,
                        'domains'=> [{
                          'type'=> 'pointed',
                          'name'=> 'test.host'
                        }]
                      }
                    }
                  }

        expected_result = "<img alt=\"New draft\" src=\"http://test.host/new-draft.png\" style=\"position: absolute; top: 0; right: 0; z-index: 9999;\" />"
        expect_template_result('{% draft_stamp "new-draft.png" %}', expected_result, listing)
      end

      context '#render' do

        it 'should not render draft stamp for groow listing' do
          listing = {
                    'listing'=> {
                      'from_groow?' => true,
                      'instant_website'=> {
                        'is_live'=>false,
                        'domains'=> [{
                          'type'=> 'pointed',
                          'name'=> 'test.host'
                        }]
                      }
                    }
                  }
          expect_template_result('{% draft_stamp "new-draft.png" %}', "", listing)
        end
      end
    end
  end
end