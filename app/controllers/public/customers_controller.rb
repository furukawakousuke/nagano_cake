class Public::CustomersController < ApplicationController
  def show
    @guest = current_customer
  end

  def edit
    @guest = current_customer
  end

  def update
    @guest = current_customer
    @guest.update(customers_params)
    redirect_to 'customers/mypage'

  end

  def unsubscribe
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


end

private
def customers_params
  require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:address,:telephone_number,:email,:is_deleted)
end