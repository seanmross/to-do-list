Rails.application.routes.draw do
  root to: 'application#angular'
  get 'welcome/about'
  get 'welcome/index'

  #namespace separates API routes from rest of application routes
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists do
      resources :items, only: [:create, :index, :update]
    end
  end

end
