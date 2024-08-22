
class ProvidersController < ApplicationController
  def autocomplete
    if params[:query].present?
      providers = Provider.where("nit LIKE ?", "%#{params[:query]}%")
      render json: providers
    else
      render json: []
    end
  end
end
