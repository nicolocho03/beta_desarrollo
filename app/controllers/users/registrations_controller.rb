class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :load_ubication_and_states, only: [:new, :create, :edit, :update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre_usuario, :ubication_id, :state_id])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre_usuario, :ubication_id, :state_id])
  end

  def load_ubication_and_states
    @ubication_states = Ubication.all
    @states = GeneralState.all
  end
  
end
