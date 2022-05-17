class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  #顧客側登録時のストロングパラメータ

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :familly_name, :first_name_kana, :familly_name_kana, :zipcode, :address, :telephone_number])

  end
end
