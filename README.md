[![Build Status](https://travis-ci.org/yoolk/yoolk_liquid.svg?branch=master)](https://travis-ci.org/yoolk/yoolk_liquid) [![Coverage Status](https://coveralls.io/repos/yoolk/yoolk_liquid/badge.png?branch=master)](https://coveralls.io/r/yoolk/yoolk_liquid?branch=master)
Summary
=======

Yoolk Liquid is a Rails Engine that contains liquid filters, drops, and tags for Yoolk Instant Website. It also provides sandbox models for [yoolk_instant_website_sandbox](https://github.com/yoolk/yoolk_instant_website_sandbox/). These models read data from json files.

It was originally developed by [Chamnap Chhorn](http://github.com/chamnap), and it is currently maintained by him.

This engine depends on:

1. [liquid](https://github.com/Shopify/liquid) from Shopify
2. [liquid-rails](https://github.com/yoolk/liquid-rails)
3. [themes_on_rails](https://github.com/yoolk/themes_on_rails)
4. [assets-rails](https://github.com/yoolk/assets-rails)

When a new feature is added to this Engine, you need to apply this feature to the followings:

1. [sample theme](https://github.com/yoolk/yoolk_instant_website_sandbox/tree/master/app/themes/sample)
2. [liquid-documentation](https://github.com/yoolk/liquid-documentation)