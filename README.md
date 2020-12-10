
## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| name（漢字）| string | null: false |
| name (カナ) | string | null: false |
| birthday   | datetime | null: false |

### Association

- has_many :Items
- has_many :Orders
- has_many :Favorites
- has_many :Comments
- has_one :Address


## Items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| Item_name  | string     | null: false                    |
| price      | integer    | null: false                    |
| 出品者      | string     | null: false                    |
| category   | string     | null: false                    |
| item_text  | text       | null: false                    |
| 状態        | text       | null: false                    |
| 配送料      | integer    | null: false                    |
| 地域        | string     | null: false                    |
| 発送の目安   | text       | null: false                    |
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
| cardNo    | integer    | null: false,                   |
| address   | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
| items     | references | null: false, foreign_key: true |


### Association

- belongs_to :User
- belongs_to :Address
- has_many :Items

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