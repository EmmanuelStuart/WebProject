class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :mfr
      t.string :productName
      t.string :productInfo
      t.decimal :price
      t.integer :quantity
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
