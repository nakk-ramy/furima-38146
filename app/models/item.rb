class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :user
  has_one_attached :image

  validates :image,                   presence: true
  validates :name,                    presence: true
  validates :text,                    presence: true
  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :price, presence: true,
                    numericality: { with: VALID_PRICEL_HALF, message: 'is invalid. Half-width number'} 
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }  
  validates :category_id,             presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_free_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end
