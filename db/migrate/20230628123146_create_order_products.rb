class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
    t.integer :order_id,      null: false
    t.integer :item,          null: false
    t.integer :price_tax,     null: false
    t.integer :amount,        null: false

    t.timestamps
    end
  end
end
