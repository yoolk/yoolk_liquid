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

        this.init(element, options);
      }

      BusinessViewOverlay.DEFAULTS = {
        label:   "Click to view a 360-degree virtual tour",
        channel: "instant website"
      }

      BusinessViewOverlay.prototype.init = function(element, options) {
        this.$element = $(element);
        this.options  = $.extend(this.getDefaults(), options);
        
        this.setPositionRelative();
        this.appendOverlay();
      }

      BusinessViewOverlay.prototype.getDefaults = function () {
        return BusinessViewOverlay.DEFAULTS;
      }

      BusinessViewOverlay.prototype.setPositionRelative = function() {
        this.$element.css('position', 'relative');
      }

      BusinessViewOverlay.prototype.appendOverlay = function() {
        this.$element.append(this.createOverlay());
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

        this.onClickOverlay($overlay);

        return $overlay;
      }

      BusinessViewOverlay.prototype.onClickOverlay = function($overlay) {
        var self = this;
        
        $overlay.click(function() {
          self.trackBusinessView()
            .success(function() {
              $overlay.remove();
            })
            .fail(function(errors) {
              $overlay.remove();
            });
        });
      }

      BusinessViewOverlay.prototype.trackBusinessView = function() {
        var md = new MobileDetect(window.navigator.userAgent);
        var device = "";

        if (md.phone() ) {
          device = "mobile";
        }
        else if (md.tablet()) {
          device = "tablet";
        }
        else {
          device = "desktop";
        }

        var params = {
          "data": {
            "device":  device,
            "channel": this.options.channel
          }
        },

        apiUrl         = this.$element.data("api-url"),
        listingAliasId = $('body').data('listing-alias-id'),
        url            = apiUrl + "/v2/listings/" + listingAliasId + "/business_view_tracks"
        
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

