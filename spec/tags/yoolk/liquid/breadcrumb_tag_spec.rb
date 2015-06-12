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
      let(:announcement)     { Yoolk::Sandbox::Listing::Announcement.new(id: 1237, updated_at: DateTime.new(2015, 2, 13, 18, 30)) }

      before do
        allow(request_drop).to receive(:theme_name).and_return('theme_a')

        request_drop.context = context
        context['listing'] = { 'instant_website' => { 'pages' => Yoolk::Liquid::InstantWebsite::PagesDrop.new([]) } }
        context['request'] = request_drop
      end

      it '#breadcrumb renders inside /videos' do
        allow(request_drop).to receive(:videos_url? ).and_return(true)
        videos_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Videos</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', videos_list)
      end

      it '#breadcrumb renders inside /attachments' do
        allow(request_drop).to receive(:attachments_url? ).and_return(true)
        attachments_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Downloads</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', attachments_list)
      end

      it '#breadcrumb renders inside /links' do
        allow(request_drop).to receive(:links_url? ).and_return(true)
        links_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Links</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', links_list)
      end

      it '#breadcrumb renders inside /map' do
        allow(request_drop).to receive(:map_url?).and_return(true)
        map_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Map</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', map_list)
      end

      it '#breadcrumb renders inside /about_us' do
        allow(request_drop).to receive(:about_us_url?).and_return(true)
        about_us_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">About us</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', about_us_list)
      end

      it '#breadcrumb renders inside /brochures' do
        allow(request_drop).to receive(:brochures_url?).and_return(true)
        brochures_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Brochures</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', brochures_list)
      end

      it '#breadcrumb renders inside /people' do
        allow(request_drop).to receive(:people_url?).and_return(true)
        people_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">People</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', people_list)
      end

      it '#breadcrumb renders inside /reservation' do
        allow(request_drop).to receive(:reservation_url?).and_return(true)
        reservation_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Reservation</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', reservation_list)
      end

      it '#breadcrumb renders inside /feedback' do
        allow(request_drop).to receive(:feedback_url?).and_return(true)
        feedback_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Feedback</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', feedback_list)
      end

      it '#breadcrumb renders inside /contact_us' do
        allow(request_drop).to receive(:contact_us_url?).and_return(true)
        contact_us_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Contact us</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', contact_us_list)
      end

      it '#breadcrumb renders inside /galleries' do
        allow(request_drop).to receive(:galleries_url?).and_return(true)
        galleries_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Galleries</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', galleries_list)
      end

      it '#breadcrumb renders inside /galleries/gallery_id' do
        allow(request_drop).to receive(:galleries_url?).and_return(true)
        galleries_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/galleries" itemprop="item"><span itemprop="name">Galleries</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">1st Floor Office</span><meta content="3" itemprop="position"></meta></li></ol>'

        ig = ::Yoolk::Sandbox::Listing::ImageGallery.new({ 'name' => '1st Floor Office' })
        expect_template_result('{% breadcrumb %}', galleries_list, { 'request' => request_drop, 'gallery' => ig })
      end

      it '#breadcrumb renders inside /announcements' do
        allow(request_drop).to receive(:announcements_url?).and_return(true)
        announcements_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Announcements</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', announcements_list)
      end

      it '#breadcrumb renders inside /announcements/announcement_id' do
        allow(request_drop).to receive(:announcements_url?).and_return(true)
        announcement_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/announcements" itemprop="item"><span itemprop="name">Announcements</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">February 13, 2015 18:30</span><meta content="3" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', announcement_list, { 'request' => request_drop, 'announcement' => announcement })
      end

      it '#breadcrumb renders inside /products' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        products_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Products</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', products_list)
      end

      it '#breadcrumb renders inside /categories/:category_id/products' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        allow(request_drop).to receive(:products_category_url?).and_return(true)

        product_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/products" itemprop="item"><span itemprop="name">Products</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Range Rover</span><meta content="3" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', product_list, { 'request' => request_drop, 'product_category' => product_category })
      end

      it '#breadcrumb renders inside /(categories/:category_id)/products/:id' do
        allow(request_drop).to receive(:products_url?).and_return(true)
        product_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/products" itemprop="item"><span itemprop="name">Products</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">evogue</span><meta content="3" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', product_list, { 'request' => request_drop, 'product' => product })
      end

      it '#breadcrumb renders inside /services' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        services_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Services</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', services_list)
      end

      it '#breadcrumb renders inside /services/category_id' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        service_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/services" itemprop="item"><span itemprop="name">Services</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Office Rental Services</span><meta content="3" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', service_list, { 'request' => request_drop, 'service_category' => service_category })
      end

      it '#breadcrumb renders inside /services/category_id/id' do
        allow(request_drop).to receive(:services_url?).and_return(true)
        service_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/services" itemprop="item"><span itemprop="name">Services</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/services/kh1-office-rental-services" itemprop="item"><span itemprop="name">Office Rental Services</span></a><meta content="3" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Rooftop</span><meta content="4" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', service_list, { 'request' => request_drop, 'service' => service })
      end

      it '#breadcrumb renders inside /menu' do
        allow(request_drop).to receive(:menu_url?).and_return(true)
        menu_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Menu</span><meta content="2" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list)
      end

      it '#breadcrumb renders inside /menu-categories/:category_id/menu' do
        allow(request_drop).to receive(:menu_url?).and_return(true)
        menu_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/menu" itemprop="item"><span itemprop="name">Menu</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Ice-cream</span><meta content="3" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list, { 'food_category' => food_category })
      end

      it '#breadcrumb renders inside /menu-categories/:category_id/menu/:id' do
        allow(request_drop).to receive(:menu_url?).and_return(true)
        menu_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/menu" itemprop="item"><span itemprop="name">Menu</span></a><meta content="2" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/menu-categories/23-ice-cream/menu" itemprop="item"><span itemprop="name">Ice-cream</span></a><meta content="3" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">Florida Strawberry Ice Cream</span><meta content="4" itemprop="position"></meta></li></ol>'

        expect_template_result('{% breadcrumb %}', menu_list, { 'food' => food })
      end

      context 'with website/pages' do
        let(:page)  { build(:instant_website_page, name: 'My Products', display_order: 1) }

        before do
          context['listing'] = { 'instant_website' => { 'pages' => Yoolk::Liquid::InstantWebsite::PagesDrop.new([page]) } }
          context['request'] = request_drop
        end

        it '#breadcrumb renders inside /products' do
          allow(request_drop).to receive(:products_url?).and_return(true)
          products_list = '<ol class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList"><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><a href="/" itemprop="item"><span itemprop="name">Home</span></a><meta content="1" itemprop="position"></meta></li><li itemprop="itemListElement" itemscope="itemscope" itemtype="http://schema.org/ListItem"><span itemprop="name">My Products</span><meta content="2" itemprop="position"></meta></li></ol>'

          expect_template_result('{% breadcrumb %}', products_list)
        end
      end
    end
  end
end