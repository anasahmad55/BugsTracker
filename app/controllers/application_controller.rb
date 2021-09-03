class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_type])
  end

  def require_user
    unless user_signed_in?
      flash[:alert] = "You must be log in"
      redirect_to new_user_session_path
    end
  end
end
