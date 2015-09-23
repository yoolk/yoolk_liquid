FactoryGirl.define do
  factory :listing, class: Yoolk::Sandbox::Listing do
    alias_id          'kh34363'
    name              'Yellow Tower inc.'
    show_map_on_web   true
    lat               101
    long              102
    app_ids           [1, 2, 3]

    trait :instant_website do
      transient do
        google_remarketing_tag nil
      end

      after(:build) do |listing, evaluator|
        listing.instant_website = build(:instant_website_website, google_remarketing_tag: evaluator.google_remarketing_tag)
      end
    end

    trait :groow do
      source_name 'groow.io'
    end

    trait :services do
      transient do
        service_count 2
      end

      after(:build) do |listing, evaluator|
        evaluator.service_count.times.each do
          listing.service_categories << Yoolk::Sandbox::ServiceCatalog::Category.new(name: "category1", services: [ build(:service) ])
        end
      end
    end

    trait :image_galleries do
      transient do
        galleries_count 2
      end

      after(:build) do |listing, evaluator|
        evaluator.galleries_count.times.each do
          listing.image_galleries << build(:image_galleries, :gallery_images)
        end
      end
    end

    trait :catalog_items do
      transient do
        catalog_item_count  2
      end

      after(:build) do |listing, evaluator|
        evaluator.catalog_item_count.times.each do
          listing.catalog_items << build(:catalog_item)
        end
      end
    end

    trait :business_photos do
      transient do
        business_photo_count  2
      end

      after(:build) do |listing, evaluator|
        evaluator.business_photo_count.times.each do
          listing.business_photos << build(:business_photos)
        end
      end
    end

    trait :currency do
      after(:build) do |listing|
        listing.currency = build(:currency)
      end
    end

    trait :products do
      after(:build) do |listing, evaluator|
        category = build(:product_category)
        product  = build(:product)

        category.product_ids = [product.id]
        product.product_category_ids = [category.id]
        product.listing = listing
        product.storefront = true

        listing.product_categories << category
      end
    end

    trait :menu do
      transient do
        foods_count 2
      end

      after(:build) do |listing, evaluator|
        evaluator.foods_count.times.each do
          listing.foods << build(:menu_food)
        end
      end
    end


  end
end
