FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '埼玉県' }
    address { '1-1' }
    building_id { 'サイタマハイツ' }
    phone_number { 12345678901 }
  end
end
