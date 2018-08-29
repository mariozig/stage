require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :admin do
    resources :announcements
    resources :comments
    resources :galleries
    resources :notifications
    resources :services
    resources :submissions
    resources :users

    root to: 'users#index'
  end

  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'

  resources :announcements, only: [:index]
  resources :galleries, only: [:index, :show] do
    resources :files, only: [:destroy], controller: 'galleries/files'
  end
  resources :notifications, only: [:index]
  resources :submissions, only: [:create, :new] do
    resources :files, only: [:destroy], controller: 'submissions/files'
  end

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
end
