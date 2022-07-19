class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_free_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one :memory
  has_one_attached :image

  validates :image,                   presence: true
  validates :name,                    presence: true
  validates :text,                    presence: true
  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :price, presence: true,
                    numericality: { with: VALID_PRICEL_HALF },
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id,             presence: true, numericality: { other_than: 1 }
  validates :sales_status_id,         presence: true, numericality: { other_than: 1 }
  validates :shipping_free_status_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,           presence: true, numericality: { other_than: 1 }
  validates :scheduled_delivery_id,   presence: true, numericality: { other_than: 1 }
end
