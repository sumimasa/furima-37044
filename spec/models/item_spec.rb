require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全ての項目が正しく入力されている' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it '画像がない時' do
        @item.image = nil
        @item.valid?

        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空のとき' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないとき' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが選択されてないとき' do
        @item.category_id = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'カテゴリーの初期値を選択したとき' do
        @item.category_id = 0
        @item.valid?

        expect(@item.errors.full_messages).to include('Category カテゴリーを選択してください')
      end

      it '商品の状態が選択されてないとき' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '商品の状態の初期値を選択したとき' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition 商品の状態を選択してください')
      end

      it '配送料の負担が選択されてないとき' do
        @item.cost_allocation_id = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Cost allocation can't be blank")
      end

      it '配送料の負担の初期値を設定した場合' do
        @item.cost_allocation_id = 0
        @item.valid?

        expect(@item.errors.full_messages).to include('Cost allocation 配送料の負担者ーを選択してください')
      end

      it 'areaが空のとき' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'areaの初期値を選択したとき' do
        @item.area_id = 0
        @item.valid?

        expect(@item.errors.full_messages).to include('Area 発送元の地域を選択してください')
      end

      it '発送の目安が空のとき' do
        @item.send_standard_id = ''
        @item.valid?

        expect(@item.errors.full_messages).to include("Send standard can't be blank")
      end

      it '発送の目安が初期値の場合' do
        @item.send_standard_id = 0
        @item.valid?

        expect(@item.errors.full_messages).to include('Send standard 発送までの日数を選択してください')
      end

      it 'priceが空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満の時' do
        @item.price = 100
        @item.valid?

        expect(@item.errors.full_messages).to include('Price 価格は300円~9,999,999円、半角で入力してください')
      end

      it 'priceが10000000以上の時' do
        @item.price = 99_999_999
        @item.valid?

        expect(@item.errors.full_messages).to include('Price 価格は300円~9,999,999円、半角で入力してください')
      end

      it 'priceに半角数字以外が混合していたとき' do
        @item.price ="12334a"
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price 価格は300円~9,999,999円、半角で入力してください")
      end

      it 'ユーザー情報が紐づいていないといけない' do
        @item.user=nil
        @item.valid?
        
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
