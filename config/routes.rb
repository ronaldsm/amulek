Rails.application.routes.draw do
  get 'companionship/index'

  resources :companionships

  root 'companionship#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
