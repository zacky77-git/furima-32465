require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規投稿' do
    context '新規投稿がうまくいくとき' do
      it "必須要素が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    
    context '新規投稿がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では登録できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが0では登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "state_idが0では登録できない" do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 0")
      end
      it "delivery_charge_idが0では登録できない" do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it "area_idが0では登録できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it "send_date_idが0では登録できない" do
        @item.send_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Send date must be other than 0")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "price が9999999より高いと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "price が300より低いと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end
