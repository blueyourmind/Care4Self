Rails.application.routes.draw do
  # devise_for :users, controllers: { registrations: 'profiles' }
  devise_for :users
  resources :medications do
    member do
      get 'set_duration'
      patch 'set_duration', to: 'medications#update_duration'
      get 'congrats'
    end
  end

  # resources :medications do
  #   member do
  #     get 'set_duration'
  #   end
  # end

  resources :frequencies, only: [:index, :show, :create, :update, :destroy]
  resources :intervals, only: [:index, :show, :create, :update, :destroy]
  resources :medication_frequencies, only: [:index, :show, :create, :update, :destroy]
  resources :reminders, only: [:index, :show, :create, :update, :destroy]

  root to: "pages#home"
  resources :dashboards, only: [:index, :show]

  # get 'profile', to: 'profiles#show'
  resource :profile, only: [:show]


end
