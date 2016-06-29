Rails.application.routes.draw do
  
  get 'items/index'
  get 'items/new'
  get 'items/show'

  get 'history' => 'users#history'

  resources :plans do
    resources :boxes do
      resources :items
      put 'ship' => 'boxes#ship'
    end
  end

  root 'pages#home'
  get '/about' => 'pages#about'

  resources :users do
    resources :registrations
    delete 'unsubscribe' => 'registrations#unsubscribe'
  end


  get "/sign_in" => "sessions#new", as: :sign_in
  post "/sign_in" => "sessions#create"
  # get "/sign_out" => "sessions#destroy", as: :sign_out
  delete 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  get "/sign_up" => "users#new", as: :sign_up
  post "/sign_up" => "users#create"

  get 'auth/:provider/callback', to: 'sessions#facebook'
  # match 'auth/:provider/callback', to: 'sessions#facebook', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]


end
