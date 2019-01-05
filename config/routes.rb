Rails.application.routes.draw do
  get 'companionships/index'

  resources :companionships do
    resources :appointments
  end

  get '/appointments', to: 'appointments#index'

  get '/calendars/:id', to: 'calendars#show', as: :calendar_path
  root 'companionships#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
