require 'sidekiq/web'

Rails.application.routes.draw do
  # devise_for :users, controllers: { registrations: 'profiles' }

  root to: "pages#home"
  devise_for :users

  # mount Noticed::Engine, at: 'notifications'
  # get 'notifications', to: 'pages#notifications', as: :user_notifications

  resources :medications, only: [:new, :index, :show, :create, :update, :edit, :destroy] do
    member do
      # get 'set_duration'
      # patch 'set_duration', to: 'medications#update_duration'
      get 'congrats'
    end
  end

  # resources :medications do
  #   delete 'destroy_all', on: :collection
  # end


  # resources :frequencies, only: [:index, :show, :create, :update, :destroy]
  resources :intervals, only: [:index, :show, :create, :update, :destroy]
  resources :medication_frequencies, only: [:index, :show, :create, :update, :destroy]
  resources :reminders, only: [:index, :show, :create, :update, :destroy]


  # resources :dashboards, only: [:index, :show]

  # get 'profile', to: 'profiles#show'
  resource :profile, only: [:show]

  devise_scope :user do
    resources :sessions, only: [:destroy], path: 'users/sign_out', as: :destroy_user_session
  end
  
if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end

end
