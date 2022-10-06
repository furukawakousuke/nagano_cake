# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  before_action :authenticate_customer!,except:[:top,:about]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # 
  
  protected
  
  def customer_state
    @customer = Customer.find_by(email: params[:customers][:email])
    return if !@customer
    if @customer.valid_password?(params[:customers][:password]) && (@customer.is_deleted  == false)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_user_registration
    end
    
  end
  
end
