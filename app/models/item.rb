class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :brand
  belongs_to :category
  belongs_to :cost
  belongs_to :duration
  belongs_to :prefecture

  with_options presence: true do
  
  end
  
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :brand_id
    validates :category_id
    validates :cost_id
    validates :duration_id
    validates :prefecture_id
  end
  
end
