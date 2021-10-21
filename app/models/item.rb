class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :cost_allocation
  belongs_to :area
  belongs_to :send_standard
  has_one_attached :image
  

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 0, message: 'カテゴリーを選択してください' }
    validates :condition_id, numericality: { other_than: 0, message: '商品の状態を選択してください' }
    validates :cost_allocation_id, numericality: { other_than: 0, message: '配送料の負担者ーを選択してください' }
    validates :area_id, numericality: { other_than: 0, message: '発送元の地域を選択してください' }
    validates :send_standard_id, numericality: { other_than: 0, message: '発送までの日数を選択してください' }
    validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
      message: '価格は300円~9,999,999円、半角で入力してください' }
    
              
  end
end
