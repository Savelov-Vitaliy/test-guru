Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  get :signup, to: "users#new"
  get :login, to: "sessions#new"
  delete :logout, to: "sessions#destroy"

  resources :users, only: :create
  resources :sessions, only: %i[create]

  resources :tests do
    resources :questions, shallow: true, except: :index do
       resources :answers, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

end
