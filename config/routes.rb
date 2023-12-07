require 'sidekiq/web'
Rails.application.routes.draw do
  # devise_for :users, controllers: { registrations: 'profiles' }
  mount Sidekiq::Web => '/sidekiq'
  root to: "pages#home"
  devise_for :users

  get '/notifications', to: 'notifications#index'
  delete '/notifications', to: 'notifications#destroy_all'
  resources :medications, only: [:new, :index, :show, :create, :update, :edit, :destroy] do
    member do
      get 'congrats'
    end
  end


resources :notifications, only: [:destroy]

  # resources :reminders, only: [:index, :show, :edit, :update, :destroy] do
  #   member do
  #     patch :mark_as_taken
  #   end
  # end

  resources :intervals, only: [:index, :show, :create, :update, :destroy]
  resources :medication_frequencies, only: [:index, :show, :create, :update, :destroy]
  resource :profile, only: [:show]

  devise_scope :user do
    resources :sessions, only: [:destroy], path: 'users/sign_out', as: :destroy_user_session
  end






end
