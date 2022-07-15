require 'rails_helper'

RSpec.describe OrderMemory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_memory = FactoryBot.build(:order_memory, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end
  describe '商品購入' do
    context '商品が購入できるとき' do
      it '全ての必須箇所が存在すれば購入できる' do
        expect(@order_memory).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_memory.building = ''
        expect(@order_memory).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it 'userが結びついていないと購入できない' do
        @order_memory.user_id = nil
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが結びついていないと購入できない' do
        @order_memory.item_id = nil
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include("Item can't be blank")
      end
      it 'クレジットカード情報が入力されていないと購入できない' do
        @order_memory.token = ''
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_memory.postal_code = ''
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号にハイフンがなければ購入できない' do
        @order_memory.postal_code = 123-4567
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号が全角数字の場合購入できない' do
        @order_memory.postal_code = '１２３４５６７'
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Postal code is invalid')
      end
      it '発送元の地域に「---」が選択されている場合購入できない' do
        @order_memory.prefecture_id = 1
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空の場合購入できない' do
        @order_memory.city = ''
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の場合購入できない' do
        @order_memory.addresses = ''
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空の場合購入できない' do
        @order_memory.phone_number = ''
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号にハイフンがある場合購入できない' do
        @order_memory.phone_number = 000 - 1111 - 2222
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が10桁未満の場合購入できない' do
        @order_memory.phone_number = 000011
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁以上の場合購入できない' do
        @order_memory.phone_number = 0001111222222
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が全角数字の場合購入できない' do
        @order_memory.phone_number = '０００１１１１２２２２'
        @order_memory.valid?
        expect(@order_memory.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
