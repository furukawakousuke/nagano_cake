class ApplicationController < ActionController::Base

 before_action :configure_permitted_parameters, if: :devise_controller?



  protected

    
    # ログイン時のパスを変更してる
    
     



    #ログアウト時のパスの変更
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      else
        new_customer_session_path
      end
    end





    # 新規登録の保存機能
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,
                :email, :postal_code, :residence, :telephone_number,:address])

      #sign_upの際にnameのデータ操作を許。追加したカラム。
  		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
        
    end

end
