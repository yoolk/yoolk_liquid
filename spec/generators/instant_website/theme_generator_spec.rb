require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/instant_website/theme_generator'

describe InstantWebsite::Generators::ThemeGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../../spec/dummy/tmp", __FILE__)

  before do
    prepare_destination
    run_generator %w(theme_a)
  end

  it "exists `app/themes`" do
    expect(file("app/themes")).to exist
  end

  it "exists `app/themes/theme_a`" do
    expect(file("app/themes/theme_a")).to exist
  end

  it "exists `app/themes/theme_a/locales`" do
    expect(file("app/themes/theme_a/locales")).to exist
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

  context "layout file: liquid" do
    before(:all)  {
      Rails.configuration.app_generators.rails[:template_engine] = :liquid
    }
    after(:all)  {
      Rails.configuration.app_generators.rails[:template_engine] = :haml
    }
    subject { file("app/themes/theme_a/views/layouts/theme_a.liquid") }

    it { should exist }
    it { should contain(/\{\{ \'theme_a\/all\' | asset_path | javascript_include_tag \}\}/) }
    it { should contain(/\{\{ \'theme_a\/all\' | asset_path | stylesheet_link_tag \}\}/) }
    it { should contain(/\{\{ content_for_layout \}\}/) }
  end
end