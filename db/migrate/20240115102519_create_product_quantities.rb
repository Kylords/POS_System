class CreateProductQuantities < ActiveRecord::Migration[7.1]
  def change
    create_table :product_quantities do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
