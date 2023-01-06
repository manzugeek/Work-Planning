FactoryBot.define do

  factory :worker do
    title { "MyString" }
    dept { "MyString" }

    association :shift
  end 
end
