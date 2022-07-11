class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,                    presence: true
  validates :text,                    presence: true
  validates :category_id,             presence: true
  validates :sales_status_id,         presence: true
  validates :shipping_free_status_id, presence: true
  validates :prefecture_id,           presence: true
  validates :scheduled_delivery_id,   presence: true
  validates :price,                   presence: true
  validates :image,                   presence: true
end
