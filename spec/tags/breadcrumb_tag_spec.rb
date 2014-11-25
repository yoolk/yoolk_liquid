require 'rails_helper'

module Yoolk
  module Liquid
    describe BreadcrumbTag do
      let(:request_drop) { RequestDrop.new }

      before do
        request_drop.context = context
      end

      it '#breadcrumb renders inside /map' do
        allow(request_drop).to receive(:map_url?).and_return(true)
        map_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Map</li></ol>'

        expect_template_result('{% breadcrumb %}', map_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /about_us' do
        allow(request_drop).to receive(:about_us_url?).and_return(true)
        about_us_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>About us</li></ol>'

        expect_template_result('{% breadcrumb %}', about_us_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /brochures' do
        allow(request_drop).to receive(:brochures_url?).and_return(true)
        brochures_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Brochures</li></ol>'

        expect_template_result('{% breadcrumb %}', brochures_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /people' do
        allow(request_drop).to receive(:people_url?).and_return(true)
        people_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>People</li></ol>'

        expect_template_result('{% breadcrumb %}', people_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /reservation' do
        allow(request_drop).to receive(:reservation_url?).and_return(true)
        reservation_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Reservation</li></ol>'

        expect_template_result('{% breadcrumb %}', reservation_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /feedback' do
        allow(request_drop).to receive(:feedback_url?).and_return(true)
        feedback_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Feedback</li></ol>'

        expect_template_result('{% breadcrumb %}', feedback_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /contact_us' do
        allow(request_drop).to receive(:contact_us_url?).and_return(true)
        contact_us_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Contact us</li></ol>'

        expect_template_result('{% breadcrumb %}', contact_us_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /galleries' do
        allow(request_drop).to receive(:galleries_url?).and_return(true)
        galleries_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Galleries</li></ol>'

        expect_template_result('{% breadcrumb %}', galleries_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /galleries/gallery_id' do
        allow(request_drop).to receive(:galleries_url?).and_return(true)
        galleries_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/galleries">Galleries</a></li><li>1st Floor Office</li></ol>'

        ig = ::Yoolk::Sandbox::Listing::ImageGallery.new({ 'name' => '1st Floor Office' })
        expect_template_result('{% breadcrumb %}', galleries_list, { 'request' => request_drop, 'gallery' => ig })
      end

      it '#breadcrumb renders inside /announcements' do
        allow(request_drop).to receive(:announcements_url?).and_return(true)
        announcements_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Announcements</li></ol>'

        expect_template_result('{% breadcrumb %}', announcements_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /announcements/announcement_id' do
        allow(request_drop).to receive(:announcements_url?).and_return(true)
        announcement_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/announcements">Announcements</a></li><li>1237</li></ol>'

        announcement = ::Yoolk::Sandbox::Listing::Announcement.new({ 'id' => 1237 })
        expect_template_result('{% breadcrumb %}', announcement_list, { 'request' => request_drop, 'announcement' => announcement })
      end

      it '#breadcrumb renders inside /products' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        products_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Products</li></ol>'

        expect_template_result('{% breadcrumb %}', products_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /products/category_id' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        product_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/products">Products</a></li><li>Other Cars</li></ol>'

        product_category = ::Yoolk::Sandbox::ProductCatalog::Category.new({'name' => 'Other Cars'})
        expect_template_result('{% breadcrumb %}', product_list, { 'request' => request_drop, 'product_category' => product_category })
      end

      it '#breadcrumb renders inside /products/category_id/id' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        product_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/products">Products</a></li><li><a href="/products/112-range-rover">Range Rover</a></li><li>evogue</li></ol>'

        product_category = ::Yoolk::Sandbox::ProductCatalog::Category.new({'id' => 112, 'name' => 'Range Rover'})
        product = ::Yoolk::Sandbox::ProductCatalog::Product.new({'category' => product_category, 'name' => 'evogue'})
        expect_template_result('{% breadcrumb %}', product_list, { 'request' => request_drop, 'product' => product })
      end

      it '#breadcrumb renders inside /services' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        services_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Services</li></ol>'

        expect_template_result('{% breadcrumb %}', services_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /menu' do
        menu_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Menu</li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list, { 'request' => request_drop })
      end

    end
  end
end