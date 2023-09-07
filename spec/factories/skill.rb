FactoryBot.define do
  factory :skill do
    name { 'HTML' }
    level { 30 }
    created_at { Time.new(2023, 6, 1) }
    association :user
    association :category
  end
end