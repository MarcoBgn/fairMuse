Rails.application.routes.draw do

  resources :charges
  resources :tracks
  resources :users, only: [:index]
  resources :streams, only: [:create]
  devise_for :users, skip: [ :sessions ]
  as :user do
    post '/api/login' => 'sessions#create'
    delete '/api/logout' => 'sessions#destroy'
  end

  match '*any' => 'application#options', :via => [:options]
end

