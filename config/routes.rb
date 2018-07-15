Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'test#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
       resources :answers, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end
