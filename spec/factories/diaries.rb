FactoryBot.define do
  factory :diary do
    title {"写真"}
    text {"きれい"}
    association :user
  end
end
