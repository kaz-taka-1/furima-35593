# furima-35593のER図

## users テーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| email          | string | null: false |
| password       | string | null: false |
| nickname       | string | null: false |
| firstname      | text   | null: false |
| lastname       | text   | null: false |
| firstname_kana | text   | null: false |
| lastname_kana  | text   | null: false |
| birth_year     | string | null: false |
| birth_month    | string | null: false |
| birth_day      | string | null: false |

### Association
has_many :items


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
| card_id         | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :card


## cards テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| valid_year    | string     | null: false                    |
| valid_month   | string     | null: false                    |
| security_code | string     | null: false                    |

### Association
has_many :items
has_one :address


## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipalities  | text       | null: false                    |
| street_number   | text       | null: false                    |
| building_number | text       | null: false                    |
| phone_number    | string     | null: false                    |
| card_id         | references | null: false, foreign_key: true |

### Association
belongs_to :card