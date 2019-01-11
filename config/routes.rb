Rails.application.routes.draw do
  get 'companionships/index'

  resources :companionships do
    resources :appointments
  end

  # get '/appointments', to: 'appointments#index'
  # get '/appointments/:id', to: 'appointments#show', as: :appointments_path

  get '/calendars/:id', to: 'calendars#show', as: :calendar_path
  get '/calendar', to: 'calendars#show_first', as: :calendar_default
  root 'calendars#show_first'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
