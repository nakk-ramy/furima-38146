FactoryBot.define do
  factory :memory do
    association :user
    association :item
  end
end
