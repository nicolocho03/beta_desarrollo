class ProvidersController < ApplicationController
  def find_by_nit
    provider = Provider.find_by(nit: params[:nit])
    if provider
      render json: { id: provider.id, name: provider.name }
    else
      render json: { name: nil }
    end
  end
end
