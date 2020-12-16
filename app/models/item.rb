class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :state
  belongs_to_active_hash :send_date
  belongs_to_active_hash :delivery_charge
  
  with_options numericality: { other_than: 0 } ,format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}do
    validates :category_id
    validates :area_id
    validates :state_id
    validates :send_date_id
    validates :delivery_charge_id
  end
  with_options presence: true do
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :text
    validates :image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  belongs_to :user
  has_one_attached :image
end
