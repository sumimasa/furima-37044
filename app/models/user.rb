class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } 
    validates :last_name,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full-width characters"}
    validates :first_name_kana,format:{with: /\A[ァ-ヶー－]+\z/, message: "FirstNameKana kana Full-width katakana characters"}
    validates :last_name_kana,format:{with: /\A[ァ-ヶー－]+\z/, message: "LastNameKana kana Full-width katakana characters"}
    validates :birthday
    validates :password,format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,message:"Include both letters and numbers"}
  end
end
