# furima-35593のテーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| nickname           | text   | null: false |
| firstname          | text   | null: false |
| lastname           | text   | null: false |
| firstname_kana     | text   | null: false |
| lastname_kana      | text   | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association
has_many :items
has_many :uer_purchases


## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | text       | null: false                    |
| text            | text       | null: false                    |
| category        | text       | null: false                    |
| status          | text       | null: false                    |
| delivery_charge | text       | null: false                    |
| item_area       | text       | null: false                    |
| delivery_days   | string     | null: false                    |
| price           | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


##  purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | text       | null: false                    |
| municipalities  | text       | null: false                    |
| street_number   | text       | null: false                    |
| building_number | text       |                                |
| phone_number    | string     | null: false                    |

### Association
belongs_to :item
has_many :user_purchases


##  purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| purchase_id     | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
belongs_to :user_purchase