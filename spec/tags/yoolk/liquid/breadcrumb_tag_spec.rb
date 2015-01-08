require 'rails_helper'

module Yoolk
  module Liquid
    describe BreadcrumbTag do
      let(:request_drop)     { RequestDrop.new }
      let(:product)          { Yoolk::Sandbox::ProductCatalog::Product.new(category: product_category, id: 211, name: 'evogue') }
      let(:product_category) { Yoolk::Sandbox::ProductCatalog::Category.new(id: 112, name: 'Range Rover') }
      let(:service_category) { Yoolk::Sandbox::ServiceCatalog::Category.new(alias_id: 'kh1', name: 'Office Rental Services') }
      let(:service)          { Yoolk::Sandbox::ServiceCatalog::Service.new(category: service_category, name: 'Rooftop') }
      let(:food_category)    { Yoolk::Sandbox::Menu::Category.new(id: 23, name: 'Ice-cream') }
      let(:food)             { Yoolk::Sandbox::Menu::Food.new(category: food_category, name: 'Florida Strawberry Ice Cream') }
      let(:announcement)     { Yoolk::Sandbox::Listing::Announcement.new(id: 1237) }

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
        reservation_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Reservation</span></li></ol>'

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
        galleries_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/galleries" itemprop="item"><span itemprop="name">Galleries</span></a></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">1st Floor Office</span></li></ol>'

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

        expect_template_result('{% breadcrumb %}', announcement_list, { 'request' => request_drop, 'announcement' => announcement })
      end

      it '#breadcrumb renders inside /products' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        products_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Products</li></ol>'

        expect_template_result('{% breadcrumb %}', products_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /products/category_id' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        product_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/products">Products</a></li><li>Range Rover</li></ol>'

        expect_template_result('{% breadcrumb %}', product_list, { 'request' => request_drop, 'product_category' => product_category })
      end

      it '#breadcrumb renders inside /products/category_id/id' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        product_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/products">Products</a></li><li><a href="/products/112-range-rover">Range Rover</a></li><li>evogue</li></ol>'

        expect_template_result('{% breadcrumb %}', product_list, { 'request' => request_drop, 'product' => product })
      end

      it '#breadcrumb renders inside /services' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        services_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Services</li></ol>'

        expect_template_result('{% breadcrumb %}', services_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /services/category_id' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        service_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/services">Services</a></li><li>Office Rental Services</li></ol>'

        expect_template_result('{% breadcrumb %}', service_list, { 'request' => request_drop, 'service_category' => service_category })
      end

      it '#breadcrumb renders inside /services/category_id/id' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        service_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/services">Services</a></li><li><a href="/services/kh1-office-rental-services">Office Rental Services</a></li><li>Rooftop</li></ol>'

        expect_template_result('{% breadcrumb %}', service_list, { 'request' => request_drop, 'service' => service })
      end

      it '#breadcrumb renders inside /menu' do
        allow(request_drop).to receive(:menu_url?).and_return(true)
        menu_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li>Menu</li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list, { 'request' => request_drop })
      end

      it '#breadcrumb renders inside /menu/category_id' do
        allow(request_drop).to receive(:menu_url?).and_return(true)
        menu_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/menu">Menu</a></li><li>Ice-cream</li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list, { 'request' => request_drop, 'food_category' => food_category })
      end

      it '#breadcrumb renders inside /menu/category_id/id' do
        allow(request_drop).to receive(:menu_url?).and_return(true)
        menu_list = '<ol class="breadcrumb"><li><a href="/">Home</a></li><li><a href="/menu">Menu</a></li><li><a href="/menu/23-ice-cream">Ice-cream</a></li><li>Florida Strawberry Ice Cream</li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list, { 'request' => request_drop, 'food' => food })
      end
    end
  end
end