class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.integer :price
      t.string :image_id
      t.text :introduction
      t.boolean :is_saling

      t.timestamps
    end

    add_index :products, :name

  end
end
