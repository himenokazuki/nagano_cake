class Admin::ItemsController < ApplicationController
  def index
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
end
