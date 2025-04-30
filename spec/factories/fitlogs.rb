FactoryBot.define do
  factory :fitlog do
    weight { 65.5 }
    body_fat { 20.0 }
    muscle { 55.0 }
    bmr { 1500.0 }
    body_age { 25 }
    memo { "今日のトレーニング記録" }
    record_at { Time.current }

    # fitlogはuserに属しているため、関連付けが必要
    association :user
  end
end
