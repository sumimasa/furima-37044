FactoryBot.define do
  factory :item do
    name { 'text' }
    text { 'testtext' }
    category_id { 1 }
    condition_id { 1 }
    cost_allocation_id { 1 }
    area_id { 1 }
    send_standard_id { 1 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
