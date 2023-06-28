class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
    t.integer  :customer_id,   null: false
    t.integer  :postege,       null: false
    t.integer  :total_price,   null: false
    t.integer  :payment,       null: false
    t.string   :post_code,     null: false
    t.string   :address,       null: false
    t.string   :address_name,  null: false
    t.datetime :created_at,    null: false
    t.datetime :updated_at,    null: false
    #t.timestamps
    end
  end
end
