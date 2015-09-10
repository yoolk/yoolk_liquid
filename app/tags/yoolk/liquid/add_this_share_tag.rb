## addthis_share: 
#     connect to addthis plugin
#     so you have to manually append addthis javascript file inside of your theme.
# =>  {{ '//s7.addthis.com/js/300/addthis_widget.js' | javascript_include_tag }}

# {% addthis_share [style: 'large'] %}
#   {% facebook %}
#   {% twitter  %}
#   {% g_plus   %}
#   {% pinterest %}
# {% endaddthis_share %}

# With the above code it renders addthis social share with default icon.
# Addthis provide 3 difference styles
# 1. large
# 2. medium
# 3. small (DEFAULT)

## CUSTOM ICON:
# {% addthis_share %}
#   {% facebook 'social/plain/facebook.svg' %}
#   {% twitter  'social/plain/twitter.svg' %}
#   {% g_plus   'social/plain/google-plus.svg' %}
#   {% pinterest 'social/plain/pinterest.svg' %}
# {% endaddthis_share %}

# In case you want to customize CSS style of SVG icon, 
# Class: .social-share-icon { ... }
# ID:    
#       #social-facebook { // for facebook // }
#       #social-twitter  { // for twitter // }
#       #social-g-plus   { // for google plus // }
#       #social-pinterest { // for pinterest // }


module Yoolk
  module Liquid
    class AddThisShareTag < AddThisBaseTag

      def render(context)
        super context
      end

      def unknown_tag(name, params, tokens)
        super name, params, tokens
      end
    end
  end
end

Liquid::Template.register_tag('addthis_share', Yoolk::Liquid::AddThisShareTag)