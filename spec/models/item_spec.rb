require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録ができるとき' do
      it '全ての必須箇所が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品登録ができないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("テキストを入力してください")
      end
      it 'カテゴリーに「---」が選択されている場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは---以外にしてください")
      end
      it '商品の状態に「---」が選択されている場合登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は---以外にしてください")
      end
      it '配送料の負担に「---」が選択されている場合登録できない' do
        @item.shipping_free_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は---以外にしてください")
      end
      it '発送元の地域に「---」が選択されている場合登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は---以外にしてください")
      end
      it '発送までの日数に「---」が選択されている場合登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は---以外にしてください")
      end
      it '価格の情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が半角数字でなければ登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は半角数字で入力してください')
      end
      it '価格が¥300以下であると登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300円以上にしてください')
      end
      it '価格が¥9,999,999以上であると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9,999,999円以下にしてください')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
