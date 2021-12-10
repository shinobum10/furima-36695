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
|user|references|null: false, foreign_key: true|

### Association
・belongs_to :user 

・has_one :purchase_record



## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|purchase_record|references|null: false,foreign_key: true|


### Association

・belongs_to :purchase_record

## purchase_recordsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association

・belongs_to :item

・belongs_to :user 

・has_one :destination


