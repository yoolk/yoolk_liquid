require 'rails_helper'

module Yoolk
  module Liquid
    describe AddThisShareTag do
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

      it '{% facebook %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% facebook 'facebook.svg' %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-facebook\"><path d=\"M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z\"></path></svg></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% twitter %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% twitter %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% twitter %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% twitter "twitter.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-twitter\"><path d=\"M22.46,6C21.69,6.35 20.86,6.58 20,6.69C20.88,6.16 21.56,5.32 21.88,4.31C21.05,4.81 20.13,5.16 19.16,5.36C18.37,4.5 17.26,4 16,4C13.65,4 11.73,5.92 11.73,8.29C11.73,8.63 11.77,8.96 11.84,9.27C8.28,9.09 5.11,7.38 3,4.79C2.63,5.42 2.42,6.16 2.42,6.94C2.42,8.43 3.17,9.75 4.33,10.5C3.62,10.5 2.96,10.3 2.38,10C2.38,10 2.38,10 2.38,10.03C2.38,12.11 3.86,13.85 5.82,14.24C5.46,14.34 5.08,14.39 4.69,14.39C4.42,14.39 4.15,14.36 3.89,14.31C4.43,16 6,17.26 7.89,17.29C6.43,18.45 4.58,19.13 2.56,19.13C2.22,19.13 1.88,19.11 1.54,19.07C3.44,20.29 5.7,21 8.12,21C16,21 20.33,14.46 20.33,8.79C20.33,8.6 20.33,8.42 20.32,8.23C21.16,7.63 21.88,6.87 22.46,6Z\"></path></svg></a></div>)
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% g_plus %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% g_plus %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_google_plusone_share\"></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% g_plus %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% g_plus "google-plus.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_google_plusone_share\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-g-plus\"><path d=\"M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z\"></path></svg></a></div>)
        expect_template_result(template, expected, { 'listing' => listing })
      end
      
      it '{% pinterest %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% pinterest %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_pinterest_share\"></a></div>"
        expect_template_result(template, expected, { 'listing' => listing })
      end

      it '{% pinterest %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% pinterest "google-plus.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_pinterest_share\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-pinterest\"><path d=\"M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z\"></path></svg></a></div>)
        expect_template_result(template, expected, { 'listing' => listing })
      end
    end
  end
end