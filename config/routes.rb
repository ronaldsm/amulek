Rails.application.routes.draw do
  get 'companionships/index'

  resources :companionships

  root 'companionships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
