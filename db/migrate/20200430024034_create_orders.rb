class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :member, foreign_key: true
      t.integer :total_price
      t.integer :postage, defalut: 800
      t.integer :payment
      t.string :reciever
      t.string :postal_code
      t.string :address
      t.integer :order_status, defalut: 0

      t.timestamps
    end

    add_index :orders, :id

  end
end
