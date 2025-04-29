FactoryBot.define do
  factory :user do
    # メールアドレスを一意にするためにシーケンスを使用
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
