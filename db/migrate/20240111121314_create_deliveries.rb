class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :delivery_method
      t.string :price
      t.boolean :enabled

      t.timestamps
    end
  end
end
