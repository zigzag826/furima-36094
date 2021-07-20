# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| last_name          | string | null: false              |
| first_name	       | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type       | Options            |
| ---------------------- | ---------- | ------------------ |
| users                  | references | foreign_key: true  |
| products               | string     | null: false        |
| text                   | text       | null: false        |
| category_id            | integer    | null: false        |
| status_id              | integer    | null: false        |
| shipping-fee-status_id | integer    | null: false        |
| prefecture_id          | integer    | null: false        |
| scheduled-delivery_id  | integer    | null: false        |
| price                  | integer    | null: false        |

### Association
- belongs_to :user
- has_one    :order

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Column              | Type       | Options            |
| ------------------- | ---------- | ------------------ |
| postcode            | string     | null: false        |
| prefecture_id       | integer    | null: false        |
| city                | string     | null: false        |
| block               | string     | null: false        |
| building            | string     |                    |
| phone_number        | string     | null: false        |
| orders              | references | foreign_key: true  |

### Association
- belongs_to :orders