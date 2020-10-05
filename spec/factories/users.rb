FactoryBot.define do
  factory :user do
    nickname              {"たろう"}
    email                 {Faker::Internet.free_email}
    password              {"a00000"}
    password_confirmation {password}
  end
end
