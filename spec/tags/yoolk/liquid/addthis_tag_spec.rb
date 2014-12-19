require 'rails_helper'

module Yoolk
  module Liquid
    describe AddThisTag do

      it 'should have addthis tool = follow ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis tool: 'follow' %}{% endaddthis %}", got)
      end

      it 'should render small style ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis tool: 'follow', style: 'small' %}{% endaddthis %}", got)
      end

      it 'should render medium style ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_20x20_style\"></div>"
        expect_template_result("{% addthis tool: 'follow', style: 'medium' %}{% endaddthis %}", got)
      end

      it 'should render large style ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style\"></div>"
        expect_template_result("{% addthis tool: 'follow', style: 'large' %}{% endaddthis %}", got)
      end

      it 'should have passed option style one of [large, medium, small]' do
        expect {
          ::Liquid::Template.parse("{% addthis %}{% endaddthis %}")
        }.to raise_error
      end

      it 'should render nothing if facebook tag or twitter page is not passed' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        template.render!(context).strip.should == got
      end

      it '{% facebook %} should optionally have option image in hash format' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% facebook %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"></a></div>"
        template.render!(context).strip.should == got
      end

      it '{% facebook %} option image { url: "/path/to/image.jpg", size: "10x10" }' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% facebook image { url: '/path/to/image.png', size: '10x10' } %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"><img alt=\"Image\" height=\"10\" src=\"/path/to/image.png\" width=\"10\" /></a></div>"
        template.render!(context).strip.should == got
      end

      it '{% facebook %} option image { url: "/path/to/image.jpg" }' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% facebook image { url: '/path/to/image.png' } %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"><img alt=\"Image\" src=\"/path/to/image.png\" /></a></div>"
        template.render!(context).strip.should == got
      end

      it '{% facebook %} option image { url: {{ "theme-name/image.jpg" | image }} }' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% facebook image { url: {{ 'sample/twitter.png' | image_path }} } %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Mkmusics\" class=\"addthis_button_facebook_follow\"><img alt=\"Twitter\" src=\"/images/sample/twitter.png\" /></a></div>"
        template.render!(context).strip.should == got
      end

      it '{% twitter %} option image { url: "/path/to/image.jpg", size: "10x10" }' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% twitter image { url: "/path/to/image.jpg", size: "10x10" } %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Listing_1\" class=\"addthis_button_twitter_follow\"></a></div>"
        template.render!(context).strip.should == got
      end

      it '{% twitter %} option image { url: "/path/to/image.jpg" }' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% twitter image { url: "/path/to/image.jpg" } %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Listing_1\" class=\"addthis_button_twitter_follow\"></a></div>"
        template.render!(context).strip.should == got
      end

      it '{% twitter %} option image { url: {{ "theme-name/image.jpg" | image }} }' do
        listing = {
                    'listing'=> {
                      'facebook_page'=> {
                        'name'=>"Mkmusics"
                      },
                      'twitter_account'=> {
                        'url'=> 'https://twitter.com/Listing_1'
                      }
                    }
                  }

        template = ::Liquid::Template.parse multiline_string(<<-END_LIQUID)
          |  {% addthis tool: 'follow' %}
          |     {% twitter image { url: {{ 'sample/twitter.png' | image_path }} } %}
          |  {% endaddthis %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a addthis:userid=\"Listing_1\" class=\"addthis_button_twitter_follow\"><img alt=\"Twitter\" src=\"/images/sample/twitter.png\" /></a></div>"
        template.render!(context).strip.should == got
      end

    end
  end
end