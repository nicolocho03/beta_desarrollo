class ProvidersController < ApplicationController
  def autocomplete
    if params[:term].present?
      nits = Provider.where('nit LIKE ?', "%#{params[:term]}%").order(:nit).limit(10).pluck(:nit, :id)
      render json: nits.map { |nit, id| { label: nit, value: id } }
    else
      render json: []
    end
  end
end
