
## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false |
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
<!-- - has_many :favorites -->
<!-- - has_many :comments -->


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
<!-- - has_many :comments -->
<!-- - has_many :favorites -->

## address テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| post_code | integer    | null: false,                   |<!-- 郵便番号 >
| area_id   | integer    | null: false                    |<!-- 都道府県 >
| district  | text       | null: false,                   |<!-- 市区町村 >
| area_code | integer    | null: false,                   |<!-- 番地 >
| building  | string     | null: false,                   |<!-- マンションなど >
| phone_number   | string    | null: false,               |<!-- 電話番号 >


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

<!-- ## comments テーブル

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
- belongs_to :item -->