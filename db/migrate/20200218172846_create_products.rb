class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 4, scale: 2
      t.integer :amount

      t.timestamps
    end
  end
end
