Rails.application.routes.draw do
  root 'welcome#about'
  get 'welcome/about'
  get 'welcome/index'
end
