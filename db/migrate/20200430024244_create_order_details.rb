class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :price
      t.integer :amount
      t.integer :production_status

      t.timestamps
    end
  end
end
