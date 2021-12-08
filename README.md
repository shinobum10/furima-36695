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
|description|text|null: false|
|cost_id|integer|null: false|
|duration_id|integer|null: false|
|prefecture_id|integer|null: false|
|category_id|integer|null: false|
|brand_id|integer|null: false|
|user|integer|integer|null: false, references :user|

### Association
・belongs_to :user 

・has_many :images 

・belongs_to_active_hash :prefecture


## destinationテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|brand_id|integer|null: false, references :brand|

### Association

・has_many :purchase_records

## purchase_recordテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|null: false, references :user|
|brand|integer|null: false, references :brand|

### Association

・belongs_to :item

・belongs_to :user 


