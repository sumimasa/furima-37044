require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー登録' do
    context 'ユーザー登録できる時' do
      it '全て正しく入力されている時' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'nicknameが空のとき' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空のとき' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複しているとき' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが@を含んでいないとき' do
        @user.email = 'texttest'
        @user.valid?

        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空のとき' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが５文字以下のとき' do
        @user.password = '1234'
        @user.valid?

        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字だけの時' do
        @user.password = 'abcdefghi'
        @user.valid?

        expect(@user.errors.full_messages).to include('Password パスワードは英数字混合にしてください')
      end

      it 'passwordが数字のみの時' do
        @user.password = '1234567'
        @user.valid?

        expect(@user.errors.full_messages).to include('Password パスワードは英数字混合にしてください')
      end

      it 'passwordに全角を含む時' do
        @user.password = 'abcdefgテスト'
        @user.valid?

        expect(@user.errors.full_messages).to include('Password パスワードは英数字混合にしてください')
      end

      it 'passwordとpassword_confirmationが一致しないとき' do
        @user.password = 'abc1234'
        @user.password_confirmation = 'abcd12345'
        @user.valid?

        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空のとき' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角ではないとき' do
        @user.first_name = 'text'
        @user.valid?

        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'last_nameが空のとき' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角ではないとき' do
        @user.last_name = 'test'
        @user.valid?

        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'first_name_kanaが空のとき' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがカタカナ以外の時' do
        @user.first_name_kana = 'test'
        @user.valid?

        expect(@user.errors.full_messages).to include('First name kana カタカタで入力してください')
      end

      it 'last_name_kanaが空のとき' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_nama_kanaがカタカナ以外の時' do
        @user.last_name_kana = 'text'
        @user.valid?

        expect(@user.errors.full_messages).to include('Last name kana カタカナで入力してください')
      end

      it '生年月日が空のとき' do
        @user.birthday = ''
        @user.valid?

        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
