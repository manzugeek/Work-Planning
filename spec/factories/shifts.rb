FactoryBot.define do
  factory :shift do
    start_at { 1 }
    end_at { 8 }
    slot { 1 }

  association :workers, factory: :worker

    after(:create) do |shift|
      create_list(:worker, 3, shift: shift)
    end
  end
end
