Rails.application.routes.draw do

  resources :charges
  resources :tracks
  resources :users, only: [:index]
  devise_for :users, skip: [:sessions, :registrations]
  as :user do
    post '/api/signup' => 'registrations#create'
    post '/api/login' => 'sessions#create'
    delete '/api/logout' => 'sessions#destroy'
  end

  match '*any' => 'application#options', :via => [:options]
end
