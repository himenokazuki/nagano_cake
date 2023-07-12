class Admin::ItemsController < ApplicationController
  def index
     @items = Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item = Item.new(item_params)

  if @item.save
  end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:image, :name,:introduction,:price)
  end
end
