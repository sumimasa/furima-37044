# テーブル設計

## users テーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------            |
| nickname           | string | null: false            |
| email              | string | null: false,unique:true|
| encrypted_password | string | null: false            |
| first_name         | string | null: false            |
| last_name          | string | null: false            |
| first_name_kana    | string | null: false            |
| last_name_kana     | string | null: false            |
| birth_dat          | data   | null: false            |


### Association
 - has_many :items
 - has_many :records


 ## items テーブル

| Column             | Type     | Options                      |
| ------------------ | -------- | ---------------------------- |
| name               | string   | null: false                  |
| text               | text     | null: false                  |
| category_id        | integer  | null: false                  |
| condition_id       | integer  | null: false                  |
| cost_allocation_id | integer  | null: false                  |
| area_id            | integer  | null: false                  |
| send_standard_id   | integer  | null: false                  | 
| price              | integer  | null: false                  |
| user               |references| null:false,foreign_key: true |

### Association
- belongs_to :user
- has_one :record

## order テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false,foreign_key: true |
| item               | references | null:false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :record

## addresses テーブル
| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| postal_code        | string   | null: false                    |
| area_id            | integer  | null: false                    |
| city               | string   | null: false                    |
| house_number       | string   | null: false                    |
| building_name      | string   |                  |
| telephone_number   | string   | null: false                    |
| record             |references| null: false ,foreign_key: true |

### Association
- belongs_to :record
