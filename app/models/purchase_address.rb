class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_id, :phone_number, :prefecture_record, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :prefecture_id
  end
  
  def save
    purchase = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_id: building_id, phone_number: phone_number, purchase_record_id: purchase.id)
    # 各テーブルにデータを保存する処理
  end
end 