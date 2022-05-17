# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  protected
  # 退会しているかを判断するメソッド（is_deletedのほうがいい？）
  def customer_state
    ## 入力されたemailからアカウントを1権取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別する
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_customer_session_path
    else
      flash[:notice] = "項目を入力してください"
    ## is_deletedがtrueだった場合とfalseだった場合の処理を実装
    end
  end

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
  # end
end
