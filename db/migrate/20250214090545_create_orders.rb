class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.integer :paymant_method, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shoping_cost, null: false
      t.integer :total_payment, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
