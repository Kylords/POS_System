class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_ids, array: true, default: []
      t.string :order_type
      t.string :delivery_address
      t.string :status
      t.string :total_price
      t.integer :quantities, array: true, default: []
      t.integer :delivery_id
      t.integer :payment_id

      t.string :province
      t.string :city
      t.string :baranggay
      t.string :street

      t.string :room_unit
      t.string :floor
      t.string :building
      t.string :remarks
      t.string :nearest_landmark


      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile

      t.timestamps
    end
  end
end