Rails.application.routes.draw do
  resources :project_types
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'pages#home'

  resources :bills do
    member do
      get 'edit_compras'
      patch 'update_compras'
      get 'edit_sst'
      patch 'update_sst'
      get 'edit_compras_segunda_entrega'
      patch 'update_compras_segunda_entrega'
      get 'edit_gerencia'
      patch 'update_gerencia'
      get 'edit_contabilidad'
      patch 'update_contabilidad'
      patch 'send_to_sst'
      patch 'send_to_compras'
      get 'edit_contabilidad_causacion'
      patch 'update_contabilidad_causacion'
      get 'edit_contabilidad_pago'
      patch 'update_contabilidad_pago'
    end
    collection do
      get 'compras'
      get 'sst'
      get 'gerencia'
      get 'contabilidad'
      get 'contabilidad_causacion'
      get 'contabilidad_pago'
      get 'search'
      patch 'update_contabilidad_causacion'
      patch 'update_contabilidad_pago'
      
    end
  end

  resources :specific_states
  resources :general_states
  resources :ubications
  
  get "up" => "rails/health#show", as: :rails_health_check
  get '/find_provider', to: 'providers#find_by_nit'
end



