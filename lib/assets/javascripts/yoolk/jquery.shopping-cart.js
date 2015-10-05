//= require js-cookie/v2.0.2

/*
 * Plugin Name: Jquery Shopping Cart
 *
 * Author: Instant Website Team
 *
 * Note: Call Jquery Shopping Cart after jQuery in Application JS loaded
 */

window.addEventListener("load", function() {
  (function($) {

    ShoppingCart = function(element) {
      this.item = null;
      this.$element = null;
      this.cart = [];
      this.locales = null;
      this.item_qty = 0;
      this.item_id = null;

      this.init(element);
    }

    ShoppingCart.prototype.init = function(element) {
      if (!$(element).find('#shopping-cart-list').length) {
        return
      }

      this.$element     = $(element);
      this.locales      = this.$element.data('ecommerce-locales')
      this.checkoutUrl  = this.$element.data('checkout-url')
      this.currencyCode = $('body').data('currency-code')
      this.assignCookieToCart();
      this.bindClickAddToCart();
      this.bindClickCartIcon();
      this.bindClickDocument();
    }

    ShoppingCart.prototype.assignCookieToCart = function() {
      this.cart = window.app.cart_items;
      this.updateItemInList();
      this.updateTotalItems();
    }

    ShoppingCart.prototype.bindClickDocument = function() {
      var $element = this.$element;

      $(document).on('click', function (e) {
        var container = $('.shopping-cart-icon')

        if (!container.is(e.target) && container.has(e.target).length === 0) {
          $element.find('.badge-open').removeClass('badge-show')
        }
      });
    }

    ShoppingCart.prototype.bindClickCartIcon = function() {
      var $element = this.$element;

      $element.find('.shop-badge').on('click', function() {
        $element.find('.badge-open').toggleClass('badge-show');
      })
    }

    ShoppingCart.prototype.bindClickAddToCart = function() {
      var self = this;

      this.$element.find('.js-add-to-cart').each(function() {
        $(this).click(function() {
          self.item_id = $(this).data('product-id')
          self.item_qty = self.$element.find('#js-item-qty').val() || 1;

          self.item_url = $(this).data('product-url');
          goog_report_conversion(self.item_url);

          $('body').append(self.fbConversion());

          if(self.isPositiveNumber(self.item_qty)) {
            self.addToCart(this);
          }
        });
      });
    }

    ShoppingCart.prototype.fbConversion = function() {
      var script = "<!-- Facebook Conversion Code for Adds to Cart - Radin Reth 1 -->\
                    <script>(function() {\
                      var _fbq = window._fbq || (window._fbq = []);\
                      if (!_fbq.loaded) {\
                        var fbds = document.createElement('script');\
                        fbds.async = true;\
                        fbds.src = '//connect.facebook.net/en_US/fbds.js';\
                        var s = document.getElementsByTagName('script')[0];\
                        s.parentNode.insertBefore(fbds, s);\
                        _fbq.loaded = true;\
                      }\
                    })();\
                    window._fbq = window._fbq || [];\
                    window._fbq.push(['track', '6040692818386', {'value':'0.00','currency':'USD'}]);\
                    </script>\
                    <noscript><img height=\"1\" width=\"1\" alt=\"\" style=\"display:none\" src=\"https://www.facebook.com/tr?ev=6040692818386&amp;cd[value]=0.00&amp;cd[currency]=USD&amp;noscript=1\" /></noscript>";

      return script;
    }

    ShoppingCart.prototype.addToCart = function(element) {
      var sessionId = Cookies.getJSON('session_id'),
          self = this,
          url = '/carts/' + sessionId +'/cart_items';

      $.ajax({
        type: "POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: url,
        data: {
          cart_item: {
            product_id: self.item_id,
            quantity: self.item_qty
          }
        },
        success:function(data) {
          self.item = data
          if(self.itemExists()) {
            self.updateItem();
          }else {
            self.addItem();
          }
          self.updateTotalItems();
          self.updateItemInList();
          self.flyImageToCart(element);
          $('#add-to-cart-errors').text('');
        },
        error: function (request, status, error) {
          $('#add-to-cart-errors').text(request.responseText);
        }
      });

    }

    ShoppingCart.prototype.flyImageToCart = function(addToCartEl) {
      var wrapper = $(addToCartEl).closest(".js-shopping-cart"),
        imgToDrag = wrapper.find(".js-image-fly-to-cart").eq(0),
        cartIcon  = this.$element.find(".shop-badge"),
        top, left, imgclone;

      if (imgToDrag) {
          top       = (imgToDrag.offset().top + (imgToDrag.outerHeight()/2)) - 75;
          left      = (imgToDrag.offset().left + imgToDrag.outerWidth()/2) - 75;
          imgClone = imgToDrag.clone()
          .offset({
            top: top,
            left: left
        })
          .css({
            'margin': '0',
            'opacity':  '0.5',
            'z-index':  '100',
            'width':    '150px',
            'height':   '150px',
            'position': 'absolute'
        })
          .appendTo($('body'))
          .animate({
            'width': 45,
            'height': 45,
            'top': cartIcon.offset().top + 10,
            'left': cartIcon.offset().left + 10
        }, 1200, 'easeInOutExpo');

        setTimeout(function () {
            cartIcon.effect("shake", {
              times: 2
            }, 200);
        }, 1500);

        imgClone.animate({
          'width': 0,
          'height': 0
        }, function () {
          $(this).detach()
        });
      }
    }

    ShoppingCart.prototype.addItem = function() {
      this.cart.push(this.item);
    }

    ShoppingCart.prototype.updateItem = function() {
      var cart = this.cart,
          item = this.item;

      for(var i=0; i<cart.length; i++) {
        if (cart[i]["id"] == item.id) {
          cart[i]["quantity"] = item.quantity;
        }
      }

      this.cart = cart;
    }

    ShoppingCart.prototype.bindClickRemoveFromCart = function() {
      var self = this;

      this.$element.find('.remove-from-cart').each(function() {
        $(this).on("click", function(e) {
          e.stopPropagation();
          var clicker = this;
          var sessionId = Cookies.getJSON('session_id');
          $.ajax({
            type: "DELETE",
            beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
            url: '/carts/'+sessionId+'/cart_items/'+$(clicker).data('id'),
            success:function(data) {
              self.removeItem($(clicker).data('id'));
              self.updateTotalItems();
            }
          });

        })
      })
    }

    ShoppingCart.prototype.removeItem = function(item_id) {
      var cart = this.cart;

      for(var i=0; i<cart.length; i++) {
        if (cart[i]["id"] == item_id) {
          cart = $.grep(cart, function(value) {
            return value != cart[i];
          });
        }
      }

      this.cart = cart;
      this.updateItemInList();
      this.$element.find('.badge-open').addClass('badge-show')
    }

    ShoppingCart.prototype.updateTotalItems = function() {
      var cart = this.cart,
          totalItems = 0;

      for(var i=0; i<cart.length; i++) {
        totalItems += 1;
      }

      this.$element.find('#total-items').html(totalItems);
    }

    ShoppingCart.prototype.getTotal = function() {
      var cart = this.cart,
          subtotal = 0,
          total = 0,
          currencyCode = $('body').data('currency-code');

      for(var i=0; i<cart.length; i++) {
        subtotal = cart[i]['quantity'] * cart[i]['price'];

        total += subtotal;
      }

      return this.formatCurrency(total, currencyCode);
    }

    ShoppingCart.prototype.itemExists = function() {
      var cart = this.cart,
          item  = this.item;
      for(var i=0; i<cart.length; i++) {
        if (cart[i]['id'] == item.id) return true;
      }
    }

    ShoppingCart.prototype.updateItemInList = function() {
      var cart = this.cart,
          $unOrderList = $('<ul class="list-unstyled badge-open">'),
          $liSubtotal  = $('<li class="subtotal">');

          $unOrderList.append(this.buildLiHeader());

          for(var i=0; i<cart.length; i++) {
            $unOrderList.append(this.buildItemLi(cart[i]));
          }

      $unOrderList.append(this.buildSubtotalLi());
      $('#shopping-cart-list').html($unOrderList);

      this.bindClickRemoveFromCart();
      this.emptyCart();
      this.toggleBadge();
    }

    ShoppingCart.prototype.buildLiHeader = function() {
      $liHeader = $('<li class="header">'),
      $h4 = $('<h4>').text(this.locales.shopping_cart);

      return $liHeader.append($h4);
    }

    ShoppingCart.prototype.buildItemLi = function(item) {
      var currencyCode = $('body').data('currency-code'),
          qtyWithPrice = item.quantity + " x " + this.formatCurrency(item.price, currencyCode),
          $li = $('<li>'),
          $wrapperLeft = $('<div class="wrapper-left">'),
          $wrapperRight = $('<div class="wrapper-right">'),
          $imgWrapper = $('<div class="img-wrapper">'),
          $img = $('<img>').attr({src: item.image_url}),

          $button = $('<button type="button" class="close remove-from-cart"/>'),
          $overflowH = $('<div class="overflow-h">'),
          $link = $('<a class="item-name">').text(item.name).attr({href: item.url}),
          $small = $('<small>').text(qtyWithPrice);

      $button.attr({'data-id': item.id}).text("×");
      $imgWrapper.append($img);
      $wrapperLeft.append($imgWrapper);
      $overflowH.append($link, $small)
      $wrapperRight.append($button, $overflowH)

      return $li.append($wrapperLeft, $wrapperRight);
    }

    ShoppingCart.prototype.buildSubtotalLi = function() {
      var totalCost = this.getTotal(),
          $li = $('<li class="subtotal">'),
          $div = $('<div class="overflow-h">'),
          $spanLabel = $('<span class="label">').text(this.locales.subtotal),
          $spanCost = $('<span class="subtotal-cost">').text(totalCost);

      $div.append($spanLabel, $spanCost);

      var template = '<a href="' + this.checkoutUrl + '" class="btn btn-checkout">'+ this.locales.checkout +'</a>'
      return $li.append($div, template)
    }

    ShoppingCart.prototype.emptyCart = function() {
      $unOrderList = $('<ul class="list-unstyled badge-open">'),
      $liEmptyMessage = $('<li class="empty-info">').text(this.locales.empty_cart);

      $unOrderList.append(this.buildLiHeader(), $liEmptyMessage);

      if(this.cart.length == 0 ) {
        $('#shopping-cart-list').html($unOrderList);
      }
    }

    ShoppingCart.prototype.toggleBadge = function() {
      if(this.cart.length == 0 ) {
        this.$element.find('#total-items').hide();
        $('.fa-shopping-cart').addClass('empty-cart');
      }else {
        this.$element.find('#total-items').show();
        $('.fa-shopping-cart').removeClass('empty-cart');
      }
    }

    ShoppingCart.prototype.isPositiveNumber = function(val) {
      var pattern = /^\d+$/;

      return pattern.test(val) && parseInt(val) > 0
    }

    ShoppingCart.prototype.formatCurrency = function(num, currency) {
      return currency + " " + num.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
    }


    function Plugin() {
      return new ShoppingCart(this);
    }

    var old = $.fn.shoppingCart;

    $.fn.shoppingCart = Plugin;
    $.fn.shoppingCart.Constructor = ShoppingCart;

    // SHOPPING CART NO CONFLICT
    // =================================

    $.fn.shoppingCart.noConflict = function () {
      $.fn.shoppingCart = old;
      return this;
    }

  }(jQuery));

  // init jquery shopping cart
  $('.js-shopping-cart').shoppingCart();
});
