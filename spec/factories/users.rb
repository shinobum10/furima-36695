FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {"s12345"}
    password_confirmation {password}
    family_name {"森山"}
    first_name {"しのぶ"}
    family_name_kana {"モリヤマ"}
    first_name_kana {"シノブ"}
    birth_day {"1991-1-10"}
  end
end