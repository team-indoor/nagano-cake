class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member, foreign_key: true
      t.integer :total_price
      t.integer :postage
      t.integer :payment
      t.string :reciever
      t.string :postal_code
      t.string :address
      t.integer :order_status

      t.timestamps
    end

    add_index :orders, :id

  end
end
