class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :orderNumber
      t.datetime :orderdate
      t.text :deliveryStatus
      t.text :paymentStatus
      t.integer :quantity
      t.integer :item
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
