require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '登録できる場合' do
      it '全てが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'パスワードは、6文字以上、半角英数字混合での入力で登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力で登録できること' do
        @user.firstname = 'やマ田'
        @user.lastname = '太ろウ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'パスワードは、確認用を含めて2回入力すると登録できること' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '登録できない場合' do
      it 'ニックネームが空だと登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、半角英語のみ入力では登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'パスワードは、半角数字のみ入力では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'パスワードは、全角では登録できないこと' do
        @user.password = '１２３ａｂｃ'
        @user.password_confirmation = '１２３ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input half-width characters.')
      end
      it 'パスワードは、５文字以下では登録できないこと' do
        @user.password = '1a'
        @user.password_confirmation = '1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードとパスワード（確認用）は、値の一致しないと登録できないこと' do
        @user.password = '123abc'
        @user.password_confirmation = '123abd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名は、名字が空だと登録できないこと' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'ユーザー本名は、名前が空だと登録できないこと' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
        @user.lastname = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
      end
      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）以外では登録できないこと' do
        @user.firstname = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid. Input full-width characters.")
      end
      it 'ユーザー本名のフリガナは、名字が空だと登録できないこと' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'ユーザー本名のフリガナは、名前が空だと登録できないこと' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'ユーザー名字のフリガナは、全角（カタカナ）以外では登録できないこと' do
        @user.lastname_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid. Input full-width katakana characters.')
      end
      it 'ユーザー名前のフリガナは、全角（カタカナ）以外では登録できないこと' do
        @user.firstname_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid. Input full-width katakana characters.')
      end
      it '生年月日が空だと登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
