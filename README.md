## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| user_birth_date    | date   | null: false               |


### Association
- has_many :items
- has_many :memories

## itemsテーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| item_name                 | string     | null: false                    |
| item_text                 | text       | null: false                    |
| item_category             | string     | null: false                    |
| item_sales_status         | string     | null: false                    |
| item_shipping_free_status | string     | null: false                    |
| item_prefecture           | string     | null: false                    |
| item_scheduled_delivery   | string     | null: false                    |
| item_price                | integer    | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association
- has_one :memorie

## memoriesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |
| orders | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :order

## orders

| Column       | Type    | Options     |
| ------------ | ------- | ------------|
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association
- has_one :memorie