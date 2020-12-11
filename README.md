
## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| encrypted_password   | string | null: false |
| nickname   | string | null: false |
| first_name_kanzi| string | null: false |
| family_name_kanzi| string | null: false |
| first_name_kana| string | null: false |
| family_name_kana| string | null: false |
| birthday   | date | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :favorites
- has_many :comments
- has_one :address


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| text            | text       | null: false                    |
| state_id        | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| send_date       | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- has_many :comments
- has_many :favorites

## address テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| address   | text       | null: false,                   |
| phoneNo   | integer    | null: false,                   |
| user_id   | references | null: false, foreign_key: true |
| items_id  | references | null: false, foreign_key: true |

### Association

- has_one :user
- has_many :orders


## orders テーブル

| Orders    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :address
- belongs_to :items

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## favorite テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item