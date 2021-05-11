# furima-35593のテーブル設計

## users テーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| firstname          | string | null: false              |
| lastname           | string | null: false              |
| firstname_kana     | string | null: false              |
| lastname_kana      | string | null: false              |
| birthday           | date   | null: false              |

### Association
has_many :items
has_many :purchase_users


## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| item_area_id       | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase


##  purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipalities  | string     | null: false                    |
| street_number   | string     | null: false                    |
| building_number | string     |                                |
| phone_number    | string     | null: false                    |

### Association
belongs_to :item
has_many :purchase_users


##  purchase_users テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :purchase_user