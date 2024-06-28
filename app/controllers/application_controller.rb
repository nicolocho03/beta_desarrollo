class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_user
      unless logged_in?
        flash[:alert] = 'Debes iniciar sesión para acceder a esta página.'
        redirect_to root_path
      end
    end
  end
