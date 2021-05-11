# furima-35593のテーブル設計

## users テーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| nickname           | text   | null: false              |
| firstname          | text   | null: false              |
| lastname           | text   | null: false              |
| firstname_kana     | text   | null: false              |
| lastname_kana      | text   | null: false              |
| birthday           | date   | null: false              |

### Association
has_many :items
has_many :purchase_users


## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | text       | null: false                    |
| status          | text       | null: false                    |
| delivery_charge | text       | null: false                    |
| item_area       | text       | null: false                    |
| delivery_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

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
has_many :purchase_users


##  purchase_users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| purchase        | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
belongs_to :purchase_user