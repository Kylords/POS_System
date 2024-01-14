class CreateOrdersProductsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :orders, :products do |t|
      # You can add additional columns if needed, e.g., t.integer :quantity
      t.index [:order_id, :product_id]
      t.index [:product_id, :order_id]
    end
  end
end
