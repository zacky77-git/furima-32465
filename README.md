
## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false unique: true |
| encrypted_password   | string | null: false |
| nickname             | string | null: false |
| first_name_kanzi     | string | null: false |
| family_name_kanzi    | string | null: false |
| first_name_kana      | string | null: false |
| family_name_kana     | string | null: false |
| birthday             | date | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| text            | text       | null: false                    |
| state_id        | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| send_date_id       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## address テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| post_code | string     | null: false,                   |
| area_id   | integer    | null: false                    |
| district  | string     | null: false,                   |
| area_code | string    | null: false,                   |
| building  | string     |                                |
| phone_number   | string    | null: false,               |
| order     | references | null: false, foreign_key: true |

### Association


- belongs_to :order


## orders テーブル

| Orders    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :address
- belongs_to :item

