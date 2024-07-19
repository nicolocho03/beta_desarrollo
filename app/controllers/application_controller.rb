class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :recepcion_has_access?
  helper_method :compras_has_access?
  helper_method :sst_has_access?
  helper_method :gerencia_has_access?
  helper_method :contabilidad_has_access?
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre_usuario, :ubication_id, :state_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre_usuario, :ubication_id, :state_id])
  end

  def recepcion_has_access?
    current_user && current_user.ubication_id == 1
  end

  def compras_has_access?
    current_user && current_user.ubication_id == 2
  end

  def sst_has_access?
    current_user && current_user.ubication_id == 3
  end

  def gerencia_has_access?
    current_user && current_user.ubication_id == 4
  end

  def contabilidad_has_access?
    current_user && current_user.ubication_id == 5
  end 
end




