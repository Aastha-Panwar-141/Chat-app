Rails.application.routes.draw do
  get 'messages/create'
  get 'chatrooms/index'
  get 'chatrooms/new'
  get 'chatrooms/show'
  get 'chatrooms/create'
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :chatrooms do
    resources :messages
  end

  # resources :chatrooms, only:[:create, :new, :show, :index] do
  #   resources :messages, only: [:create]
  # end

  root 'chatrooms#index'

end
