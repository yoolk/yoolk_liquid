require 'rails_helper'

describe Yoolk::Sandbox::InstantWebsite::Domain do
  it 'has :id attribute' do
    expect(described_class).to have_attribute(:id).of_type(String)
  end

  it 'has :name attribute' do
    expect(described_class).to have_attribute(:name).of_type(String)
  end

  it 'has :type attribute' do
    expect(described_class).to have_attribute(:type).of_type(String)
  end

  it 'has :google_analytics_key attribute' do
    expect(described_class).to have_attribute(:google_analytics_key).of_type(String)
  end

  it 'has :is_primary attribute' do
    expect(described_class).to have_attribute(:is_primary)
  end

  it 'has :created_at attribute' do
    expect(described_class).to have_attribute(:created_at).of_type(DateTime)
  end

  it 'has :instant_website attribute' do
    expect(described_class).to have_attribute(:instant_website).of_type(Yoolk::Sandbox::InstantWebsite::Website)
  end

  it 'has :updated_at attribute' do
    expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
  end

  it 'respond_to :url' do
    expect(subject).to respond_to(:url)
  end
end