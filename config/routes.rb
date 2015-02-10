Rails.application.routes.draw do
  root 'companies#index'
  resources :companies do
    resources :locations
    resources :products do
      resources :reviews
    end
  end
end
