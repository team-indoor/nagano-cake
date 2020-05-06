class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def active_member?
    if current_member.nil?
      redirect_to root_path
    else
      redirect_to root_path unless current_member.is_active?
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :phone_number, :postal_code, :address, :is_active])
  end
end
