require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end
  context '登録できる場合' do
    it '全ての項目が入力してあると登録できること' do
      expect(@purchase_address).to be_valid
    end
    
  end
  context '登録できない場合' do
    it'配送先の情報として、郵便番号が空だと登録できない'do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it'郵便番号にハイフンがないと登録できないこと'do
      @purchase_address.postal_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end
    it'郵便番号は１１桁以上の数値だと登録できないこと'do
      @purchase_address.phone_number = '123456789012'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
    it'郵便番号は数値以外だと登録できないこと'do
      @purchase_address.postal_code = 'aaa-aaaa'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
    end
    it'配送先の情報として、都道府県が空だと登録できない'do
      @purchase_address.prefectures_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it'配送先の情報として、都道府県が0だと登録できない'do
      @purchase_address.prefectures_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures must be other than 0")
    end
    it'配送先の情報として、市区町村が空だと登録できない'do
      @purchase_address.municipalities = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it'配送先の情報として、番地が空だと登録できない'do
      @purchase_address.street_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
    end
    it'配送先の情報として、電話番号が空だと登録できない'do
      @purchase_address.prefectures_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefectures can't be blank")
    end
  end
end


