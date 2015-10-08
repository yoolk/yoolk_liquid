require 'rails_helper'

module Yoolk
  module Liquid
    describe AddThisShareTag do
      it 'should have addthis_share' do
        expected = "<div class=\"addthis_toolbox addthis_default_style\"></div>"
        expect_template_result("{% addthis_share %}{% endaddthis_share %}", expected)
      end

      it 'should render nothing if facebook tag or twitter page is not passed' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style\"></div>"
        expect_template_result(template, expected)
      end

      it '{% facebook %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% facebook %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_facebook\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-facebook\"><path d=\"M17,2V2H17V6H15C14.31,6 14,6.81 14,7.5V10H14L17,10V14H14V22H10V14H7V10H10V6A4,4 0 0,1 14,2H17Z\"></path></svg></a></div>"
        expect_template_result(template, expected)
      end

      it '{% facebook %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% facebook 'facebook.svg' %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_facebook\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg type=\"facebook\" class=\"social-share-icon\" id=\"social-facebook\"></svg></a></div>"
        expect_template_result(template, expected)
      end

      it '{% twitter %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% twitter %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = "<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_twitter\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-twitter\"><path d=\"M22.46,6C21.69,6.35 20.86,6.58 20,6.69C20.88,6.16 21.56,5.32 21.88,4.31C21.05,4.81 20.13,5.16 19.16,5.36C18.37,4.5 17.26,4 16,4C13.65,4 11.73,5.92 11.73,8.29C11.73,8.63 11.77,8.96 11.84,9.27C8.28,9.09 5.11,7.38 3,4.79C2.63,5.42 2.42,6.16 2.42,6.94C2.42,8.43 3.17,9.75 4.33,10.5C3.62,10.5 2.96,10.3 2.38,10C2.38,10 2.38,10 2.38,10.03C2.38,12.11 3.86,13.85 5.82,14.24C5.46,14.34 5.08,14.39 4.69,14.39C4.42,14.39 4.15,14.36 3.89,14.31C4.43,16 6,17.26 7.89,17.29C6.43,18.45 4.58,19.13 2.56,19.13C2.22,19.13 1.88,19.11 1.54,19.07C3.44,20.29 5.7,21 8.12,21C16,21 20.33,14.46 20.33,8.79C20.33,8.6 20.33,8.42 20.32,8.23C21.16,7.63 21.88,6.87 22.46,6Z\"></path></svg></a></div>"
        expect_template_result(template, expected)
      end

      it '{% twitter %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% twitter "twitter.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_twitter\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg type=\"twitter\" class=\"social-share-icon\" id=\"social-twitter\"></svg></a></div>)
        expect_template_result(template, expected)
      end

      it '{% g_plus %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% g_plus %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_google_plusone_share\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-g-plus\"><path d=\"M23,11H21V9H19V11H17V13H19V15H21V13H23M8,11V13.4H12C11.8,14.4 10.8,16.4 8,16.4C5.6,16.4 3.7,14.4 3.7,12C3.7,9.6 5.6,7.6 8,7.6C9.4,7.6 10.3,8.2 10.8,8.7L12.7,6.9C11.5,5.7 9.9,5 8,5C4.1,5 1,8.1 1,12C1,15.9 4.1,19 8,19C12,19 14.7,16.2 14.7,12.2C14.7,11.7 14.7,11.4 14.6,11H8Z\"></path></svg></a></div>)
        expect_template_result(template, expected)
      end

      it '{% g_plus %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% g_plus "google-plus.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_google_plusone_share\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg type=\"google-plus\" class=\"social-share-icon\" id=\"social-g-plus\"></svg></a></div>)
        expect_template_result(template, expected)
      end

      it '{% pinterest %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% pinterest %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_pinterest_share\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-pinterest\"><path d=\"M13.25,17.25C12.25,17.25 11.29,16.82 10.6,16.1L9.41,20.1L9.33,20.36L9.29,20.34C9.04,20.75 8.61,21 8.12,21C7.37,21 6.75,20.38 6.75,19.62C6.75,19.56 6.76,19.5 6.77,19.44L6.75,19.43L6.81,19.21L9.12,12.26C9.12,12.26 8.87,11.5 8.87,10.42C8.87,8.27 10.03,7.62 10.95,7.62C11.88,7.62 12.73,7.95 12.73,9.26C12.73,10.94 11.61,11.8 11.61,13C11.61,13.94 12.37,14.69 13.29,14.69C16.21,14.69 17.25,12.5 17.25,10.44C17.25,7.71 14.89,5.5 12,5.5C9.1,5.5 6.75,7.71 6.75,10.44C6.75,11.28 7,12.12 7.43,12.85C7.54,13.05 7.6,13.27 7.6,13.5A1.25,1.25 0 0,1 6.35,14.75C5.91,14.75 5.5,14.5 5.27,14.13C4.6,13 4.25,11.73 4.25,10.44C4.25,6.33 7.73,3 12,3C16.27,3 19.75,6.33 19.75,10.44C19.75,13.72 17.71,17.25 13.25,17.25Z\"></path></svg></a></div>)
        expect_template_result(template, expected)
      end

      it '{% pinterest %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% pinterest "google-plus.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_pinterest_share\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg type=\"google-plus\" class=\"social-share-icon\" id=\"social-pinterest\"></svg></a></div>)
        expect_template_result(template, expected)
      end

      it '{% linkedin %}' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% linkedin %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_linkedin\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-linkedin\"><path d=\"M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z\"></path></svg></a></div>)
        expect_template_result(template, expected)
      end

      it '{% linkedin %} option with url' do
        template = multiline_string(<<-END_LIQUID)
          |  {% addthis_share %}
          |     {% linkedin "linkedin.svg" %}
          |  {% endaddthis_share %}
          END_LIQUID

        expected = %(<div class=\"addthis_toolbox addthis_default_style\"><a class=\"addthis_button_linkedin\"><?xml version=\"1.0\" encoding=\"UTF-8\"?><svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"24\" height=\"24\" viewbox=\"0 0 24 24\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" class=\"social-share-icon\" id=\"social-linkedin\"><path d=\"M21,21H17V14.25C17,13.19 15.81,12.31 14.75,12.31C13.69,12.31 13,13.19 13,14.25V21H9V9H13V11C13.66,9.93 15.36,9.24 16.5,9.24C19,9.24 21,11.28 21,13.75V21M7,21H3V9H7V21M5,3A2,2 0 0,1 7,5A2,2 0 0,1 5,7A2,2 0 0,1 3,5A2,2 0 0,1 5,3Z\"></path></svg></a></div>)
        expect_template_result(template, expected)
      end
    end
  end
end