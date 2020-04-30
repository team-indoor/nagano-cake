class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :member, foreign_key: true
      t.string :reciever
      t.integer :postal_code
      t.string :address

      t.timestamps
    end
  end
end
