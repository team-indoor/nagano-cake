class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :member, foreign_key: true
      t.string :reciever, null: false
      t.integer :postal_code, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
