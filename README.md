
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

- has_many :Items
- has_many :Orders
- has_many :Favorites
- has_many :Comments
- has_one :Address


## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name  | string     | null: false                    |
| price      | integer    | null: false                    |
| category   | string     | null: false                    |
| text  | text       | null: false                    |
| state        | text       | null: false                    |
| delivery_charge      | integer    | null: false                    |
| area        | string     | null: false                    |
| send_date   | text       | null: false                    |
| image      | ActiveStorage                               |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Order
- has_many :Comments
- has_many :Favorites

## Address テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| address   | text       | null: false,                   |
| phoneNo   | integer    | null: false,                   |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- has_one :User
- has_many :Orders


## Orders テーブル

| Orders    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :User
- has_one :Address
- belongs_to :Items

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |
| items        | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Item

## Favorite テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :User
- belongs_to :Item