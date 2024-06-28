class SessionsController < ApplicationController
    def create
      user = User.find_by(nombre_usuario: params[:user][:nombre_usuario])
  
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Inicio de sesión exitoso.'
      else
        flash.now[:alert] = 'Nombre de usuario o contraseña inválidos.'
        render 'home/index'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Sesión cerrada.'
    end
  end