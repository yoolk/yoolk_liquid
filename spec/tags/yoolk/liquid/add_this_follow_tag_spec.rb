require 'rails_helper'

module Yoolk
  module Liquid
    describe AddThisFollowTag do
      let(:listing) {
                      {
                        'facebook_page'=> {
                          'username' => 'Mkmusics'
                        },
                        'twitter_account'=> {
                          'username' => 'Listing_1'
                        }
                      }
                    }

      it 'should have addthis_follow ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis_follow %}{% endaddthis_follow %}", expected)
      end

      it 'should render small style ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis_follow, style: 'small' %}{% endaddthis_follow %}", expected)
      end

      it 'should render medium style ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_20x20_style\"></div>"
        expect_template_result("{% addthis_follow, style: 'medium' %}{% endaddthis_follow %}", expected)
      end

      it 'should render large style ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style\"></div>"
        expect_template_result("{% addthis_follow, style: 'large' %}{% endaddthis_follow %}", expected)
      end

      it 'should have passed option style one of [large, medium, small]' do
        expect {
          ::Liquid::Template.parse("{% addthis %}{% endaddthis_follow %}")
        }.to raise_error
      end

      it 'should render nothing if facebook tag or twitter page is not passed' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_follow %}
          |  {% endaddthis_follow %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% facebook %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_follow %}
          |     {% facebook %}
          |  {% endaddthis_follow %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% facebook %} with url and size' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_follow %}
          |     {% facebook '/path/to/image.png', '10x10' %}
          |  {% endaddthis_follow %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"><img alt=\"Image\" height=\"10\" src=\"/path/to/image.png\" width=\"10\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% facebook %} with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_follow %}
          |     {% facebook '/path/to/image.png' %}
          |  {% endaddthis_follow %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"><img alt=\"Image\" src=\"/path/to/image.png\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% twitter %} with url and size' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_follow %}
          |     {% twitter "/path/to/image.jpg", "10x10" %}
          |  {% endaddthis_follow %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Listing_1\" class=\"addthis_button_twitter_follow\"><img alt=\"Image\" height=\"10\" src=\"/path/to/image.jpg\" width=\"10\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% twitter %} with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_follow %}
          |     {% twitter "/path/to/image.jpg" %}
          |  {% endaddthis_follow %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Listing_1\" class=\"addthis_button_twitter_follow\"><img alt=\"Image\" src=\"/path/to/image.jpg\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end
    end
  end
end