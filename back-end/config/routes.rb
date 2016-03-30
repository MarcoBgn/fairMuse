Rails.application.routes.draw do

  devise_for :artists
  resources :charges
  resources :tracks
  resources :users, only: [:index]
  resources :streams, only: [:create]
  devise_for :users, skip: [:sessions, :registrations]

  as :user do
    post '/api/artistlogin' => 'artistsessions#create'
    delete '/api/artistlogout' => 'artistsessions#destroy'
    post '/api/artistsignup' => 'artistreg#create'
    post '/api/signup' => 'registrations#create'
    post '/api/login' => 'sessions#create'
    delete '/api/logout' => 'sessions#destroy'
    post '/api/balanceinfo' => 'artists#get_balance'
  end

  post '/api/streaminfo' => 'streams#get_user_stream_info'
  post '/api/payment' => 'payments#pay'

  match '*any' => 'application#options', :via => [:options]
end
