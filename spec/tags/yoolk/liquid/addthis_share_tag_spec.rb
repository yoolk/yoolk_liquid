require 'rails_helper'

module Yoolk
  module Liquid
    describe AddThisShareTag do

      it 'should have addthis_share ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis_share %}{% endaddthis_share %}", got)
      end

      it 'should render small style ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"></div>"
        expect_template_result("{% addthis_share, style: 'small' %}{% endaddthis_share %}", got)
      end

      it 'should render medium style ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_20x20_style\"></div>"
        expect_template_result("{% addthis_share, style: 'medium' %}{% endaddthis_share %}", got)
      end

      it 'should render large style ' do
        got = "<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style\"></div>"
        expect_template_result("{% addthis_share, style: 'large' %}{% endaddthis_share %}", got)
      end

      it 'should have passed option style one of [large, medium, small]' do
        expect {
          ::Liquid::Template.parse("{% addthis %}{% endaddthis_share %}")
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
          |  {% addthis_share %}
          |  {% endaddthis_share %}
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
          |  {% addthis_share %}
          |     {% facebook %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"></a></div>"
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
          |  {% addthis_share %}
          |     {% facebook image { url: '/path/to/image.png', size: '10x10' } %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"><img alt=\"Image\" height=\"10\" src=\"/path/to/image.png\" width=\"10\" /></a></div>"
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
          |  {% addthis_share %}
          |     {% facebook image { url: '/path/to/image.png' } %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"><img alt=\"Image\" src=\"/path/to/image.png\" /></a></div>"
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
          |  {% addthis_share %}
          |     {% facebook image { url: {{ 'sample/twitter.png' | image_path }} } %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_facebook\"><img alt=\"Twitter\" src=\"/images/sample/twitter.png\" /></a></div>"
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
          |  {% addthis_share %}
          |     {% twitter image { url: "/path/to/image.jpg", size: "10x10" } %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"></a></div>"
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
          |  {% addthis_share %}
          |     {% twitter image { url: "/path/to/image.jpg" } %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"></a></div>"
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
          |  {% addthis_share %}
          |     {% twitter image { url: {{ 'sample/twitter.png' | image_path }} } %}
          |  {% endaddthis_share %}
          END_LIQUID

        context = ::Liquid::Context.new(listing, {}, { helper: @view, view: @view, controller: @controller })

        got = "<div class=\"addthis_toolbox addthis_default_style addthis_16x16_style\"><a class=\"addthis_button_twitter\"><img alt=\"Twitter\" src=\"/images/sample/twitter.png\" /></a></div>"
        template.render!(context).strip.should == got
      end

    end
  end
end