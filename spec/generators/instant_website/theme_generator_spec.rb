require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/instant_website/theme_generator'

describe InstantWebsite::Generators::ThemeGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination "#{Rails.root}/tmp"

  before      { prepare_destination }

  context 'default' do
    before   { run_generator %w(theme_a) }

    it "exists `app/themes`" do
      expect(file("app/themes")).to exist
    end

    it "exists `app/themes/theme_a`" do
      expect(file("app/themes/theme_a")).to exist
    end

    it "exists `app/themes/theme_a/assets/images/theme_a`" do
      expect(file("app/themes/theme_a/assets/images/theme_a")).to exist
    end

    it "exists `app/themes/theme_a/assets/javascripts/theme_a`" do
      expect(file("app/themes/theme_a/assets/javascripts/theme_a")).to exist
    end

    it "exists `app/themes/theme_a/assets/javascripts/theme_a/all.js.coffee`" do
      expect(file("app/themes/theme_a/assets/javascripts/theme_a/all.js.coffee")).to exist
    end

    it "exists `app/themes/theme_a/assets/stylesheets/theme_a`" do
      expect(file("app/themes/theme_a/assets/stylesheets/theme_a")).to exist
    end

    it "exists `app/themes/theme_a/assets/stylesheets/theme_a/all.scss`" do
      expect(file("app/themes/theme_a/assets/stylesheets/theme_a/all.scss")).to exist
    end
  end

  context "layout file: liquid" do
    before        { run_generator %w(theme_a) }

    before(:all)  {
      Rails.configuration.app_generators.rails[:template_engine] = :liquid
    }
    after(:all)   {
      Rails.configuration.app_generators.rails[:template_engine] = :haml
    }
    subject { file("app/themes/theme_a/views/layouts/theme_a.liquid") }

    it { should exist }
    it { should contain(/\{\{ \'theme_a\/all\' | asset_url | javascript_include_tag \}\}/) }
    it { should contain(/\{\{ \'theme_a\/all\' | asset_url | stylesheet_link_tag \}\}/) }
    it { should contain(/\{\{ content_for_header \}\}/) }
    it { should contain(/\{\{ content_for_layout \}\}/) }
    it { should contain(/\{% draft_stamp %\}/) }
    it { should contain(/<body data-theme-name="{{ request.theme_name }}" data-listing-alias-id="{{ listing.alias_id }}" data-class-name="{{ request.js_class_name }}">/) }
  end

  context "create pages" do
    before   { run_generator %w(theme_a --pages about_us,announcements,brochures,contact_us,feedback,galleries,home,map,menu,people,products,reservation,services) }

    it "`home/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/home/index.liquid')).to exist
    end

    it "`contact_us/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/contact_us/index.liquid')).to exist
    end

    it "`about_us/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/about_us/index.liquid')).to exist
    end

    it "`announcements/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/announcements/index.liquid')).to exist
    end

    it "`brochures/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/brochures/index.liquid')).to exist
    end

    it "`feedback/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/feedback/index.liquid')).to exist
    end

    context "Galleries" do
      it "`galleries/index.liquid` should exist" do
        expect(file('app/themes/theme_a/views/galleries/index.liquid')).to exist
      end

      it "`galleries/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/galleries/show.liquid')).to exist
      end
    end

    it "`map/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/map/index.liquid')).to exist
    end

    context "Menu" do
      it "`menu/index.liquid` should exist" do
        expect(file('app/themes/theme_a/views/menu/index.liquid')).to exist
      end

      it "`menu/categories/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/menu/categories/show.liquid')).to exist
      end

      it "`menu/foods/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/menu/foods/show.liquid')).to exist
      end
    end

    it "`people/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/people/index.liquid')).to exist
    end

    context "Products" do
      it "`products/index.liquid` should exist" do
        expect(file('app/themes/theme_a/views/products/index.liquid')).to exist
      end

      it "`products/categories/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/products/categories/show.liquid')).to exist
      end

      it "`products/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/products/show.liquid')).to exist
      end
    end

    it "`reservation/index.liquid` should exist" do
      expect(file('app/themes/theme_a/views/reservation/index.liquid')).to exist
    end

    context "Services" do
      it "`services/index.liquid` should exist" do
        expect(file('app/themes/theme_a/views/services/index.liquid')).to exist
      end

      it "`services/categories/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/services/categories/show.liquid')).to exist
      end

      it "`services/show.liquid` should exist" do
        expect(file('app/themes/theme_a/views/services/show.liquid')).to exist
      end
    end

    context "Locales" do
      it "exists `app/themes/theme_a/locales`" do
        expect(file("app/themes/theme_a/locales")).to exist
      end

      it "exists `app/themes/theme_a/locales/km.yml`" do
        expect(file("app/themes/theme_a/locales/km.yml")).to exist
      end

      it "exists `app/themes/theme_a/locales/en.yml`" do
        expect(file("app/themes/theme_a/locales/en.yml")).to exist
      end

      it "exists `app/themes/theme_a/locales/id.yml`" do
        expect(file("app/themes/theme_a/locales/id.yml")).to exist
      end

      it "exists `app/themes/theme_a/locales/th.yml`" do
        expect(file("app/themes/theme_a/locales/th.yml")).to exist
      end

      it "exists `app/themes/theme_a/locales/vi.yml`" do
        expect(file("app/themes/theme_a/locales/vi.yml")).to exist
      end
    end
  end
end