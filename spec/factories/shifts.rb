FactoryBot.define do
  factory :shift do
    start_at { 1 }
    end_at { 1 }
    worker { nil }
  end
end
