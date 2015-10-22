var YIW = YIW || {};

YIW.productVariant = {
  init: function () {
    var self = this;
    $('.product-variant-item').on('click', function() {
      if($(this).hasClass("disabled"))
        return;

      $(this).siblings().removeClass("active");
      $(this).toggleClass("active");
      self._updateOptions(this);
      self._updatePrice();
      self._updateVariant();
      self._removeError(this);
    });
  },

  _updatePrice: function () {
    var products = this._getSelectedProduct();

    if (products.length > 0) {
      var salePrice = products[0].skuVal.salePrice,
        regularPrice = products[0].skuVal.regularPrice;

      if (salePrice) {
        $('.sale-price').html(currencyCode + ' ' + salePrice);
        $('.regular-price').html(currencyCode + ' ' + regularPrice);
        $('.js-discount-badge .discount-percentage').html(products[0].skuVal.discountPercentage);
        $('.js-discount-badge').show();
      } else {
        $('.sale-price').html('');
        $('.regular-price').html(currencyCode + ' ' + regularPrice);
        $('.js-discount-badge').hide();
      }
    } else {
      $('.sale-price').html('');
      $('.regular-price').html('');
      $('.js-discount-badge').hide();
    }
  },

  _getSelectedProduct: function () {
    var productVariants = $('.product-variant'),
      ids = [];

    productVariants.each(function (index) {
      var activeChild = $(this).find('li.active');
      ids.push(activeChild.data('variant-id'));
    });

    var skuProductIds = ids.join(',');

    var products = skuProducts.filter( function (skuProduct) {
      return skuProduct.skuPropIds == skuProductIds;
    });

    return products;
  },

  _updateOptions: function (product) {
    var productVariant = $($(product).closest('.product-variant')),
      nextProductVariant = $(productVariant.siblings()[0]);

    if (productVariant.find('li.active').length > 0) {
      this._disabledOption(product, nextProductVariant);
    } else {
      nextProductVariant.find('li.disabled').removeClass('disabled');
    }
  },

  _disabledOption: function (product, nextProductVariant) {
    var isFirstOrder = nextProductVariant.data('variant-order') == 1 ? false : true,
      id = $(product).data('variant-id');

    nextProductVariant.find('.product-variant-item').each( function (index) {
      var currentProduct = $(this),
        nextProductVariantId = currentProduct.data('variant-id'),
        ids = isFirstOrder ? id + ',' + nextProductVariantId : nextProductVariantId + ',' + id;

      var matchProducts = skuProducts.filter( function (productVariant) {
        return productVariant.skuPropIds == ids;
      });

      if (matchProducts.length === 0) {
        currentProduct.addClass('disabled');
      } else {
        currentProduct.removeClass('disabled');
      }
    });
  },

  _updateVariant: function () {
    var products = this._getSelectedProduct(),
      value = '';

    if (products.length > 0) {
      value = products[0].variant_id;
    } 

    $('#product-variant-id').val(value);
  },

  _removeError: function (varantItem) {
    $(varantItem).parents('.product-variant-items').removeClass('has-error');
  }
};
