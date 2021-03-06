FactoryBot.define do
  factory :order do
    association :user
    association :item
    number            { 4_242_424_242_424_242 }
    exp_month         { 5 }
    exp_year          { 28 }
    cvc               { 123 }
    postal_code       { 123 - 4567 }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { Faker::Address.city }
    addresses         { Faker::Address.street_name }
    building          { Faker::Address.street_address }
    phone_number      { 0o0011112222 }
  end
end
