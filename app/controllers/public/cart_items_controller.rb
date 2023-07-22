class Public::CartItemsController < ApplicationController
  def index
    @cart_item= CartItem.all
  end

  def update
  end

  def destroy
    cart_item = Cart_item.find(params[:id])
    cart_item.destroy
    redirect_to :"/cart_items"
  end

  def destroy_all
   redirect_to :"/cart_items"
  end

  def create
    @cart_item= CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

  private

  def cart_item_params
     params.require(:cart_item).permit(:amount, :item_id)
  end
end
