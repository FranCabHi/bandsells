class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :country, :email, :password)}  
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :country, :email, :password, :current_password)}
  end
  
  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: "Denied Access."
  end

  def current_order
    if current_user
      order = Order.find_or_create_by(user_id: current_user.id, state: 0)
    end
  end

  def resource_name
    :user
  end
   
  def resource
    @resource ||= User.new
  end
  
  def resource_class
    User
  end
   
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end