FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "example@railstutorial.org" }
    password { "foobar" }
    password_confirmation { "foobar" }
    introduce { "自己紹介が入ります" * 8 }
  end
end