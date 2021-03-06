require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  describe '配送先情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @item_order.building = nil
      expect(@item_order).to be_valid
    end


    it 'post_codeが空だと保存できないこと' do
      @item_order.post_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
    end
    it 'post_codeにハイフンがないと保存できないこと' do
      @item_order.post_code = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'area_idが0では保存できないこと' do
      @item_order.area_id = 0
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'districtが空だと保存できないこと' do
      @item_order.district = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("District can't be blank")
    end
    it 'area_codeが空だと保存できないこと' do
      @item_order.area_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Area code can't be blank",
                                                          'Area code is invalid. Input full-width characters.')
    end
    it 'phone_numberが空だと保存できないこと' do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンがあると保存できないこと' do
      @item_order.phone_number = '090-1234-5678'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Phone number is invalid. Include hyphen(-)')
    end
    it 'phone_numberが11桁以内でないと保存できないこと' do
      @item_order.phone_number = '090123456789'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'tokenが空では登録できないこと' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空では登録できないこと' do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank", "User is invalid. Input half-width characters.")
    end
    it 'item_idが空では登録できないこと' do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank", "Item is invalid. Input half-width characters.")
    end
  end
end
