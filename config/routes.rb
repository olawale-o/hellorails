# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }, path_names: {
    sign_in: 'log_in',
    sign_up: 'create_account',
    sign_out: 'logout'
  }

  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
