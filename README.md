# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_year         | integer| null: false |
| birth_month        | integer| null: false |
| birth_day          | integer| null: false |

### Association
 - has_many :items
 - has_many :records


 ## items テーブル

| Column             | Type     | Options                      |
| ------------------ | -------- | ---------------------------- |
| image              | string   | null: false                  |
| name               | string   | null: false                  |
| text               | text     | null: false                  |
| category           | integer  | null: false                  |
| condition          | integer  | null: false                  |
| cost_allocation    | integer  | null: false                  |
| area               | integer  | null: false                  |
| days               | integer  | null: false                  | 
| price              | integer  | null: false                  |
| user_id            |references| null:false,foreign_key: true |

### Association
- belongs_to :user
- has_one :record

## records テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user_id            | references | null:false,foreign_key: true |
| item_id            | references | null:false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :record

## addresses テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| postal_code        | string   | null: false                    |
| prefecture         | integer  | null: false                    |
| city               | string   | null: false                    |
| house_number       | string   | null: false                    |
| building_name      | string   | null: false                    |
| telephone_number   | string   | null: false                    |
| record_id          | integer  | null: false ,foreign_key: true |

### Association
- belongs_to :record
