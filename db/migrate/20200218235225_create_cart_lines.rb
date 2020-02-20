class CreateCartLines < ActiveRecord::Migration[6.0]
  def change
  	
    create_table :carts do |t|
      t.decimal :total, precision: 4, scale: 2, :null => false, :default => 0
      t.datetime :expires_at
      t.timestamps
    end
    
    create_table :cart_lines do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.integer :quantity, :null => false, :default => 0
      t.decimal :price, precision: 4, scale: 2, :null => false, :default => 0
      t.timestamps
    end

    add_index :cart_lines, [:product_id, :cart_id]

  end
end
