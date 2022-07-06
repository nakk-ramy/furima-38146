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

| Column                       | Type         | Options                        |
| ---------------------------- | ------------ | ------------------------------ |
| item_name                    | string       | null: false                    |
| item_text                    | text         | null: false                    |
| item_category_id             | integer      | null: false                    |
| item_sales_status_id         | integer      | null: false                    |
| item_shipping_free_status_id | integer      | null: false                    |
| prefecture_id                | integer      | null: false                    |
| item_scheduled_delivery_id   | integer      | null: false                    |
| item_price                   | integer      | null: false                    |
| user                         | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :memory

## memoriesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order

## orders

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| addresses       | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| memory          | references | null: false, foreign_key: true |

### Association
- belongs_to :memory