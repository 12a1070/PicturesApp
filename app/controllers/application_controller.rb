class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :icon])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :icon])
  end

  private
  def login_required
    redirect_to new_session_path unless current_user
  end

end
