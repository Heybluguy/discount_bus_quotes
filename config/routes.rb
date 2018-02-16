Rails.application.routes.draw do

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :companies, only: [:new, :index, :create, :edit, :update, :show, :destroy] do
      resources :states, only: [:destroy]
    end
  end

  resources :images, only: [:destroy]

  namespace :admin do
    resources :states, only: [:index, :new, :create, :destroy]
    resources :users, only: [:index, :show, :destroy]
  end

  resources :states, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
