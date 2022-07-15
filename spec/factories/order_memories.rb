FactoryBot.define do
  factory :order_memory do
    memory_id         { 1 }
    user_id           { 1 }
    item_id           { 1 }
    token             { 'tok_abcdefghijk00000000000000000' }
    postal_code       { '123-4567' }
    prefecture_id     { Faker::Number.between(from: 2, to: 48) }
    city              { Faker::Address.city }
    addresses         { Faker::Address.street_name }
    building          { Faker::Address.street_address }
    phone_number      { '00011112222' }
  end
end
