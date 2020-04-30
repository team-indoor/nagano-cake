class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :member, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :amount

      t.timestamps
    end

    add_index :cart_items, [:member_id, :product_id], unique: true

  end
end
