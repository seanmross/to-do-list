Rails.application.routes.draw do
  root 'welcome#about'
  get 'welcome/about'
  get 'welcome/index'

  #namespace separates API routes from rest of application routes
  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy]

  end

end
