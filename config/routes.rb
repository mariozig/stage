require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :announcements
    resources :notifications
    resources :services

    root to: 'users#index'
  end
  
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  
  resources :notifications, only: [:index]
  resources :submissions, only: [:create, :new]
  resources :announcements, only: [:index]

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
end
