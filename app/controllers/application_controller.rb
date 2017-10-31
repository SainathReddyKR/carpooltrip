class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?
  before_action :authenticate_user!, :except => [:home]


  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
  end

end
