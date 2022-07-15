class OrderMemory
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :memory_id, :user_id, :item_id, :token
with_options presence: true do
  validates :user_id, :item_id, :token, :city, :addresses
  validates :postal_code, { format: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :phone_number, { format: /\A\d{10}$|^\d{11}\z/ }
end

  def save
    memory = Memory.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, addresses: addresses,
                 building: building, phone_number: phone_number, memory_id: memory.id)
  end
end
