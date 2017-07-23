Rails.application.routes.draw do
  root 'welcome#about'
  get 'welcome/about'
  get 'welcome/index'

  namespace :api, defaults: { format: :json } do
    resources :users
  end

end
