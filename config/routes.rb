Rails.application.routes.draw do
  get 'welcome/about'

  get 'welcome/index'

  root 'welcome#about'

end
