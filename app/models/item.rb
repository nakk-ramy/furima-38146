class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :user
  has_one_attached :image

  validates :image,                   presence: true
  validates :name,                    presence: true
  validates :text,                    presence: true
  validates :price,                   presence: true
  validates :category_id,             presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id,         presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_free_status_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id,   presence: true, numericality: { other_than: 1 , message: "can't be blank"}
end
