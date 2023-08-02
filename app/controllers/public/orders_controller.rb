class Public::OrdersController < ApplicationController
  def new
    @orders=Order.new
  end

  def check
    @cart_item = current_customer.cart_items
    @total=0
    @order=Order.new(order_params)

    if params[:order][:address_number] == '0'
      @order.post_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    end
  end

  def create
    cart_item = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
     @order = current_customer.orders.new(order_params)
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.postege = 800
     #@order.total_price = @order.postege + @cart_item.sum(&:subtotal)

    if @order.save
# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
      cart_item.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_products にも一緒にデータを保存する必要があるのでここで保存します
      order_products = OrderProducts.new
      order_products.item_id = cart.item
      order_products.order_id = @order.id
      order_products.amount = cart.amount
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_item.order_price = cart.item.price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_item.save
     redirect_to orders_complete_path
      cart_items.destroy_all
      end
    end
  end
  def confirm
  @order = Order.new(order_params)
  @order.post_code = current_customer.post_code
  @order.address = current_customer.address
  @order.address = current_customer.address_name
  end

  def complete
  end

  def finish
  end

  def index
    @orders=current_customer.orders
  end

  def show
  end

  private
  def order_params
     params.require(:order).permit(:payment,:post_code,:address,:address_name,:total_price)
  end
end