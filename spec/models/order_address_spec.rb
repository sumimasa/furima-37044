require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '入力が正しく行われているとき' do
        expect(@order_address).to be_valid
      end

      it 'building_nameが抜けていてもできる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'tokenが空の時' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空の時' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeのハイフンが抜けている時' do
        @order_address.postal_code = '1231234'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Postal code 123-1234の形で入力してください')
      end

      it 'area_idが空の時' do
        @order_address.area_id = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Area can't be blank", 'Area 発送元の地域を選択してください')
      end

      it 'area_idが0の時' do
        @order_address.area_id = 0
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Area 発送元の地域を選択してください')
      end

      it 'cityが空の時' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空の時' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが空の時' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが10桁未満の時' do
        @order_address.telephone_number = '123'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'telephone_numberが12桁以上の時' do
        @order_address.telephone_number = '123456789123456'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'telephone_numberに半角数字以外が入っている時' do
        @order_address.telephone_number = '123-1234-1234'
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'userが紐づいていないとき' do
        @order_address.user_id = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないとき' do
        @order_address.item_id = ''
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
