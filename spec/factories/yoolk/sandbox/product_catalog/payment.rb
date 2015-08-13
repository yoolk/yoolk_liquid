FactoryGirl.define do
  factory :product_catalog_payment, class: Yoolk::Sandbox::ProductCatalog::Payment do
    id          1
    note        { 'We can collect your cash upon your delivery request for free or fee based on your location.' }

    trait :cash_on_delivery do
      name            'Cash On Delivery'
      type            'cash_on_delivery'
    end

    trait :bank_transfer do
      type            'bank_transfer'
      name            { 'Calvin Klein' }
      fee             { 1.2 }
      account_number  '1234567'
    end

    trait :credit_card_or_paypal do
      name            'Credit Card or Payment'
      type            'credit_card_or_paypal'
      fee             { 1.1 }
      paypal_email    { 'example@email.com' }
    end

    trait :custom do
      type            'custom'
      name            { 'Celcom AirCash' }
      fee             { 0.3 }
    end
  end
end