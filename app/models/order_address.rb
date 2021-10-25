class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '123-1234の形で入力してください' }
    validates :area_id, numericality: { other_than: 0, message: '発送元の地域を選択してください' }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    address = Address.create(postal_code: postal_code, area_id: area_id, city: city,
                             house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
