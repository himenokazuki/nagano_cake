class Admin::HomesController < ApplicationController
  def top
    #@orders = Orders.all.page(params[:page]).per(10)
    @orders = Order.all
  end
end
