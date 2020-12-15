class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  belongs_to :user
  has_one_attached :image

  validates :genre_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :name
    validates :price
    validates :category_id
    validates :text
    validates :state_id
    validates :delivery_charge_id
    validates :area_id
    validates :send_date_id
    validates :image
  end
end
