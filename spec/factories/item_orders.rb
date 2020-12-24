FactoryBot.define do
  factory :item_order do
    post_code { '123-4567' }
    area_id { 1 }
    district { '横浜市緑区' }
    area_code { '青山１−１−１'}
    building { '柳ビル' }
    phone_number {'09012345678'}
    user_id { 1 }
    item_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
