class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :user_birth_date, presence: true
  validates :password, { format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  validates :last_name, { format: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, { format: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, { format: /\A[ァ-ヶー]+\z/ }
  validates :first_name_kana, { format: /\A[ァ-ヶー]+\z/ }
end
