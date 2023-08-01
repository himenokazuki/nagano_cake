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
     @cart_item = current_customer.cart_items
     @order = Order.new(order_params)
     @order.customer_id = current_customer.id
     @order.postege = 800
     @order.total_price = @order.postege + @cart_item.sum(&:subtotal)
     @order.save
     @order=orderproducts.save
     redirect_to orders_complete_path
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
    @orders=Order.all
  end

  def show
  end

  private
  def order_params
     params.require(:order).permit(:payment,:post_code,:address,:address_name,:total_price)
  end
end

