class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_type
      t.string :description
      t.integer :category_id
      t.string :price
      t.string :image

      t.timestamps
    end
  end
end
