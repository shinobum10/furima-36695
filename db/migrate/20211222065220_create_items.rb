class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text    :name,          null: false
      t.integer :price,         null: false
      t.text    :description,   null: false
      t.integer :cost_id,       null: false
      t.integer :duration_id,   null: false
      t.integer :prefecture_id, null: false
      t.integer :category_id,   null: false
      t.integer :brand_id,      null: false
      t.integer :user,          null: false
      t.timestamps
    end
  end
end
