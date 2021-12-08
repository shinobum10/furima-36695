# README
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

### Association
・has_many :items 

・has_many :purchase_records







## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|string|null: false|
|cost_id|integer|null: false|
|day_id|integer|null: false|
|prefecture_id|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|integer|null: false, foreign_key: true|

### Association・belongs_to :user 

・belongs_to :category 

・belongs_to :brand 

・has_many :images 

・belongs_to_active_hash :prefecture


## destinationテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string|null: false|

### Association

・belongs_to_active_hash :purchase_records

## purchase_recordテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association

・belongs_to :item


