class Order < ApplicationRecord
   belongs_to :customer
   has_many :order_products
   has_many :items, through: :order_products
def subtotal
    item.price*1.1+order.postage
end
POSTAGE = 800
enum payment: { credit_card: 0, transfer: 1 }
end