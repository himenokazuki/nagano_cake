class Public::OrdersController < ApplicationController
  def new
    @orders=Order.new
    @cart_item = current_customer.cart_items
    if  @cart_item == []
      # render cart_items_path
      render "public/cart_items/index"
    end
  end



  def check


    @total=0
    @order=Order.new(order_params)
    @cart_item=current_customer.cart_items
    if params[:order][:address_number] == '0'#アドレスナンバーを０に渡す
      @order.post_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == '1'#アドレスナンバーを１に渡す

    else
      redirect_to  new_order_path
    end
  end

  def create

     @cart_item = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
     @order = current_customer.orders.new(order_params)
     @order.customer_id = current_customer.id
     @order.postege = 800

     @order.total_price = @order.postege + @cart_item.sum(&:subtotal)
    if @order.save

# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
      @cart_item.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_products にも一緒にデータを保存する必要があるのでここで保存します
      order_products = OrderProduct.new
      order_products.item_id = cart.item_id
      order_products.order_id = @order.id
      order_products.amount = cart.amount
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_products.price_tax =  cart.amount*cart.item.price*1.1
      order_products.save
      end
      @cart_item.destroy_all
      redirect_to orders_complete_path

    end
  end
  #def confirm
  #@order = Order.new(order_params)
  #@order.post_code = current_customer.post_code
  #@order.address = current_customer.address
  #@order.address = current_customer.address_name
 # end

  def complete
  end

  def finish
  end

  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
    @order_products=@order.order_products

    #@order=current_customer.orders
    #@order=order_product.find(params[:id])
  end

  private
  def order_params
     params.require(:order).permit(:payment,:post_code,:address,:address_name,:total_price,:item)
  end
end