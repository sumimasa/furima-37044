FactoryBot.define do
  factory :order_address do
    postal_code { '123-1234' }
    area_id { 2 }
    city { '東京' }
    house_number { '新宿2丁目' }
    building_name { '万勝' }
    telephone_number { '12312341234' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
