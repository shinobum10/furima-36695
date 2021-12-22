class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :name
      t.integer :price
      t.text :description
      t.integer :cost_id
      t.integer :duration_id
      t.integer :prefecture_id
      t.integer :category_id
      t.integer :brand_id
      t.integer :user
      t.timestamps
    end
  end
end
