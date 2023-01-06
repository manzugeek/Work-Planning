FactoryBot.define do
    factory :user do
        name {"mystring"}
        sequence(:email) { |n| "tester#{n}@example.com" }
        password {"abracadabra"}

        association :worker
    end
end