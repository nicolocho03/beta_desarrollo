class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre_usuario, :ubication_id, :state_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre_usuario, :ubication_id, :state_id])
  end

end




