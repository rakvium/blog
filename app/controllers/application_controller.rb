# ApplicationController is the only controller
# which inherits from ActionController::Base.
# All other controllers in turn inherit from ApplicationController
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_out_path_for(_resource_or_scope)
    request.referer
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(first_name last_name))
    devise_parameter_sanitizer.permit(:account_update, keys: %i(first_name last_name))
  end
end
