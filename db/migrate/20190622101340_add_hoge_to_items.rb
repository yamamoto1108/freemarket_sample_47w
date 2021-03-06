class AddHogeToItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,                  null: false, default: "", index: true
      t.integer :price,                null: false, index: true
      t.text :text
      t.integer :condition,             null: false
      t.integer :delivery_charge,      null: false
      t.integer :delivery_method,       null: false
      t.integer :prefecture_id,  null: false
      t.integer :estimated_shipping_date, null: false
      t.references :category
      t.references :brand
      t.integer :size
      t.integer :saler_id
      t.integer :buyer_id
      t.integer :sales_status,          null: false
      t.timestamps
    end
  end
end
