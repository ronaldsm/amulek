Rails.application.routes.draw do
  get 'companionships/index'

  resources :companionships do
    resources :appointments
  end
  get '/companionships/:companionship_id/appointments/:date/new', to: 'appointments#new', as: :new_companionship_appointment_with_date

  get '/calendars/:id', to: 'calendars#show', as: :calendar_path
  get '/calendar', to: 'calendars#show_first', as: :calendar_default
  root 'calendars#show_first'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
