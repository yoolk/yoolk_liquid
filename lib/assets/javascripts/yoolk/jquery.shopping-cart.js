//= require js-cookie/v2.0.2
//= require mustache

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

      this.init(element);
    }

    ShoppingCart.prototype.init = function(element) {
      this.$element     = $(element);
      this.locales      = this.$element.data('ecommerce-locales')
      this.checkoutUrl  = this.$element.data('checkout-url')
      this.assignCookieToCart();
      this.bindClickAddToCart();
      this.updateItemInList();
      this.updateTotalItems();
      this.bindClickCartIcon();
      this.bindClickDocument();
    }

    ShoppingCart.prototype.assignCookieToCart = function() {
      var getCookieVal = Cookies.getJSON('shopping-cart');

      if(getCookieVal != undefined) {
        this.cart = getCookieVal.items;
      }
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
          var qty = self.$element.find('#js-item-qty').val() || 1;

          if(self.isPositiveNumber(qty)) {
            var  product = $(this).data('product').product;

            product.quantity = parseInt(qty);
            self.item = product;

            self.addToCart();
            self.updateTotalItems();
          }
        });
      });
    }

    ShoppingCart.prototype.addToCart = function() {
      this.assignCookieToCart();

      if(this.itemExists()) {
        this.updateItem();
      }else {
        this.addItem();
      }

      this.updateItemInList();
    }

    ShoppingCart.prototype.addItem = function() {
      this.cart.push(this.item);
    }

    ShoppingCart.prototype.updateItem = function() {
      var cart = this.cart,
          item = this.item;

      for(var i=0; i<cart.length; i++) {
        if (cart[i]["id"] == item.id) {
          cart[i]["quantity"] += item.quantity;
        }
      }

      this.cart = cart;
    }

    ShoppingCart.prototype.bindClickRemoveFromCart = function() {
      var self = this;

      this.$element.find('.remove-from-cart').each(function() {
        $(this).on("click", function(e) {
          e.stopPropagation();

          self.removeItem($(this).data('id'));
          self.updateTotalItems();
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
        totalItems += cart[i]["quantity"];
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
        if (cart[i]["id"] == item.id) return true;
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
      Cookies.set('shopping-cart', { items: this.cart });
    }

    ShoppingCart.prototype.buildLiHeader = function() {
      $liHeader = $('<li class="header">'),
      $h4 = $('<h4>').text(this.locales.shopping_cart);

      return $liHeader.append($h4);
    }

    ShoppingCart.prototype.buildItemLi = function(item) {
      var currencyCode = $('body').data('currency-code'),
          qtyWithPrice = item.quantity + " x " + item.price + " " + currencyCode,
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
          $btnCheckout = $('<a href="' + this.checkoutUrl + '" class="btn btn-checkout">').text(this.locales.checkout);

      $div.append($spanLabel, $spanCost);

      return $li.append($div, this.checkoutForm());
    }

    ShoppingCart.prototype.checkoutForm = function() {
      var template = $('#tmpl-checkout').html();
      var data = {
        'products': this.cart,
        'checkout_url': this.checkoutUrl
      };

      // TODO: checkout button locale
      Mustache.parse(template);   // optional, speeds up future uses
      return Mustache.render(template, data);
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
      return num.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,") + " " + currency;
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