FactoryBot.define do
  factory :user do
    nickname { '鈴木' }
    email { Faker::Internet.free_email }
    password { 'suzuki51' }
    password_confirmation { password }
    first_name { '鈴木' }
    last_name { '鶴' }
    first_name_kana { 'スズキ' }
    last_name_kana { 'ツル' }
    birthday { '1999-01-01' }
  end
end
