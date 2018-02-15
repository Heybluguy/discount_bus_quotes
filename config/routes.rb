Rails.application.routes.draw do

  root "welcome#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :companies, only: [:new, :index, :create, :edit, :update, :show, :destroy]
  end

  namespace :admin do
    resources :states, only: [:index, :destroy, :new, :create]
    resources :users, only: [:index, :show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
