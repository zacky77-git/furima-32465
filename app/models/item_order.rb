class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :district, :area_code, :building, :phone_number, :user_id, :item_id, :token



  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :district, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :area_code, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Include hyphen(-)' }, length: { maximum: 11 } 
    validates :user_id, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :item_id, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
    validates :token
  end

  def save
    
    @order = Order.create(user_id: user_id, item_id: item_id)

      

    Address.create(post_code: post_code, area_id: area_id, district: district, area_code: area_code, building: building,
                   phone_number: phone_number, order_id: @order.id) 

  end
end
