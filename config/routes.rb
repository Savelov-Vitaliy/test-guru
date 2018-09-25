Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users,  path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                      controllers: { sessions: 'users/sessions' }


  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
       resources :answers, shallow: true
      end
    end

    resources :gists, only: %i[index destroy]
  end

end
