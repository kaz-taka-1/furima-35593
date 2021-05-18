require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '登録できる場合' do
    it '全ての項目が入力してあると出品できる'do
      expect(@item).to be_valid
    end
    it '販売価格は半角数字とき登録できること'do
      @item.price ='555'
      expect(@item).to be_valid
    end
  end
  context '登録できない場合' do
    it '商品画像をがないと登録できないこと'do
    @item.image =nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品の説明が空だと登録できないこと'do
      @item.text =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーの情報が空だと登録できないこと'do
      @item.category_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態についての情報が空だと登録できないこと'do
      @item.status_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担についての情報が空だと登録できないこと'do
      @item.delivery_charge_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it '発送元の地域についての情報が空だと登録できないこと'do
      @item.prefectures_id =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end
    it '販売価格についての情報が空だと登録できないこと'do
      @item.price =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は、¥300より安いと登録できないこと'do
      @item.price ='100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range.")
    end
    it '販売価格は、¥9,999,999より高いと登録できないこと'do
      @item.price ='10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range.")
    end
    it '販売価格は全角数字だと登録できない'do
      @item.price ='５９０'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price before type cast is invalid. Input half-width characters.")
    end
  end
end

