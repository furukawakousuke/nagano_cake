class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @guest = current_customer
  end

  def edit
    @guest = current_customer
  end

  def update
    @guest = current_customer
    @guest.update(customers_params)
    redirect_to '/customers/mypage'

  end

  def unsubscribe
  end

  def withdraw
    @guest = current_customer
    @guest.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


end

private
def customers_params
  params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number,:email)
end