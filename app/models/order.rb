class Order < ApplicationRecord
   has_many :order_products, dependent: :destroy
   belongs_to :customer
   
def subtotal
    item.price*1.1+order.postage
end
POSTAGE = 800
enum payment: { credit_card: 0, transfer: 1 }
end