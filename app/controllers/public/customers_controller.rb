class Public::CustomersController < ApplicationController
  def show

    @customer=current_customer
  end

  def edit
    #is_matching_login_customer
    @customer = current_customer
  end

  def update
    @customer = current.customer
    @customer.update(customer_params)
    if customer.save
       flash[:notice] = "successfully "
      redirect_to customers_path(@customer.id)
    end
  end

  def confirm
  end

  def withdrawal
  end

  private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
  end
end