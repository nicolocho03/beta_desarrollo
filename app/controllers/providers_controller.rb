class ProvidersController < ApplicationController
  def find_by_nit
    provider = Provider.find_by(nit: params[:nit])
    if provider
      render json: { id: provider.id, name: provider.name }
    else
      render json: { name: nil }
    end
  end

  def autocomplete
    # Busca proveedores cuyo NIT comience con los caracteres ingresados
    if params[:nit].present?
      providers = Provider.where("nit LIKE ?", "#{params[:nit]}%").limit(5) # Limita a 5 resultados
      render json: providers.pluck(:nit, :name) # Devuelve solo el NIT y el nombre
    else
      render json: []
    end
  end
end
