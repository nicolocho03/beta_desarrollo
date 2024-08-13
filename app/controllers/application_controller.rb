class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  helper_method :recepcion_has_access?
  helper_method :compras_has_access?
  helper_method :sst_has_access?
  helper_method :gerencia_has_access?
  helper_method :contabilidad_has_access?
  helper_method :current_user_role

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

  def current_user_role
    return "Bienvenido, Inicia Sesión para acceder." unless current_user

    location = case current_user.state_id
               when 1
                 "Obra"
               when 2
                 "Oficina"
               else
                 "Estado no reconocido."
               end

    role = case current_user.ubication_id
           when 1
             "Recepción"
           when 2
             "Compras"
           when 3
             "SST"
           when 4
             "Gerencia"
           when 5
             "Contabilidad"
           else
             "Ubicación no reconocida."
           end

    "#{role}/#{location}"
  end

  def after_sign_in_path_for(resource)
    case resource.ubication_id
    when 1
      bills_path 
    when 2
      compras_bills_path 
    when 3
      sst_bills_path 
    when 4
      gerencia_bills_path
    when 5
      contabilidad_causacion_bills_path 
    else
      root_path 
    end
  end
end





