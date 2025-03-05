class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, default: 0.0
      t.integer :stock, default: 0

      t.timestamps
    end
  end
end
