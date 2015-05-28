//= require mobile-detect/v1.2.0

/*
 * Plugin Name: Bussiness View Overlay
 *
 * Author: Instant Website Team
 *
 * Note: Call Business View Overlay after jQuery in Application JS loaded
 */

window.onload = function() {

  (function($) {

      BusinessViewOverlay = function(element, options) {
        this.options  = null;
        this.$element = null;
        this.$overlay = null
        this.device   = null;

        this.init(element, options);
      }

      BusinessViewOverlay.DEFAULTS = {
        label:   "Click to view a 360-degree virtual tour",
        channel: "instant website"
      }

      BusinessViewOverlay.prototype.init = function(element, options) {
        this.$element = $(element);
        this.options  = $.extend(this.getDefaults(), options);
        this.device   = this.getDevice();
        this.$overlay = this.getOverlay();

        this.setPositionRelative();
        this.onClickOverlay();
        this.appendOverlay();

        var self = this;
        if (this.device == "desktop") {
          this.$overlay.hide();
          this.$element.hover(function() {
            self.$overlay.show();
          }, function() {
            self.$overlay.hide();
          })
        }
      }

      BusinessViewOverlay.prototype.getDevice = function() {
        var md     = new MobileDetect(window.navigator.userAgent),
            device = '';

        if (md.phone()) {
          device = "mobile";
        }
        else if (md.tablet()) {
          device = "tablet";
        }
        else {
          device = "desktop";
        }

        return device;
      }

      BusinessViewOverlay.prototype.getDefaults = function () {
        return BusinessViewOverlay.DEFAULTS;
      }

      BusinessViewOverlay.prototype.setPositionRelative = function() {
        this.$element.css('position', 'relative');
      }

      BusinessViewOverlay.prototype.appendOverlay = function() {
        this.$element.append(this.$overlay);
      }

      BusinessViewOverlay.prototype.getOverlay = function() {
        return this.$overlay = this.$overlay || this.createOverlay();
      }

      BusinessViewOverlay.prototype.createOverlay = function() {
        var label = this.$element.data('label') || this.options.label;

        $overlay  = $($.parseHTML("<div class='bizview-overlay'></div>"));
        $overlay.css({
          'top': 0,
          'left': 0,
          'right': 0,
          'bottom': 0,
          'cursor': 'pointer',
          'position': 'absolute',
          'background-color': 'rgba(225, 225, 225, 0.7)'
        });

        $info     = $($.parseHTML("<span>" + label + "</span>"));
        $info.css({
          'top': '50%',
          'left': '50%',
          'width': '250px',
          'color': '#333',
          'font-size': '20px',
          'position': 'absolute',
          'text-align': 'center',
          'margin-right': '-50%',
          'transform': 'translate(-50%, -50%)',
          '-webkit-transform': 'translate(-50%, -50%)',
          '-ms-transform': 'translate(-50%, -50%)'
        }).appendTo($overlay);

        return $overlay;
      }

      BusinessViewOverlay.prototype.onClickOverlay = function() {
        var self = this;

        this.$overlay.click(function() {
          self.trackBusinessView()
            .success(function() {
              self.$overlay.remove();
            })
            .fail(function(errors) {
              self.$overlay.remove();
            });
        });
      }

      BusinessViewOverlay.prototype.trackBusinessView = function() {
        var params =  {
                        "data": {
                          "device":  this.device,
                          "channel": this.options.channel
                        }
                      },

            apiUrl         = $('body').data('api-url'),
            listingAliasId = $('body').data('listing-alias-id'),
            url            = apiUrl + "/v2/listings/" + listingAliasId + "/business_view_tracks";

        return $.ajax({
                  type: "POST",
                  url:  url,
                  data: params
                });
      }

      //  BUSINESS VIEW OVERLAY PLUGIN DEFINITION
      // ========================================

      function Plugin(options) {
        return this.each(function () {
          new BusinessViewOverlay(this, options);
        })
      }

      var old = $.fn.businessViewOverlay;

      $.fn.businessViewOverlay = Plugin;
      $.fn.businessViewOverlay.Constructor = BusinessViewOverlay;

      // BUSINESS VIEW OVERLAY NO CONFLICT
      // =================================

      $.fn.businessViewOverlay.noConflict = function () {
        $.fn.businessViewOverlay = old;
        return this;
      }

  }(jQuery));

  // init business view overlay
  $('.js-business-view').businessViewOverlay();
}

