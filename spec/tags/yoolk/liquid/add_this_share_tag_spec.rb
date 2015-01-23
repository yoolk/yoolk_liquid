require 'rails_helper'

module Yoolk
  module Liquid
    describe AddThisShareTag do
      let(:listing) {
                      {
                        'facebook_page'=> {
                          'page_username' => 'Mkmusics'
                        },
                        'twitter_account'=> {
                          'username' => 'Listing_1'
                        }
                      }
                    }

      it 'should have addthis_share ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis_share %}{% endaddthis_share %}", expected)
      end

      it 'should render small style ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis_share, style: 'small' %}{% endaddthis_share %}", expected)
      end

      it 'should render medium style ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_20x20_style\"></div>"
        expect_template_result("{% addthis_share, style: 'medium' %}{% endaddthis_share %}", expected)
      end

      it 'should render large style ' do
        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style\"></div>"
        expect_template_result("{% addthis_share, style: 'large' %}{% endaddthis_share %}", expected)
      end

      it 'should have passed option style one of [large, medium, small]' do
        expect {
          ::Liquid::Template.parse("{% addthis %}{% endaddthis_share %}")
        }.to raise_error
      end

      it 'should render nothing if facebook tag or twitter page is not passed' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% facebook %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% facebook %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% facebook %} option with url and size' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% facebook '/path/to/image.png', '10x10' %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"><img alt=\"Image\" height=\"10\" src=\"/path/to/image.png\" width=\"10\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% facebook %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% facebook '/path/to/image.png' %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"><img alt=\"Image\" src=\"/path/to/image.png\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% twitter %} option with url and size' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% twitter "/path/to/image.jpg", "10x10" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"><img alt=\"Image\" height=\"10\" src=\"/path/to/image.jpg\" width=\"10\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% twitter %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% twitter "/path/to/image.jpg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"><img alt=\"Image\" src=\"/path/to/image.jpg\" /></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end
    end
  end
end