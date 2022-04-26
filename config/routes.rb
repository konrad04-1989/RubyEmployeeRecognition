# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users
  devise_for :employees

  namespace :admin do
    root to: 'pages#dashboard'
    resources :kudos, only: %i[index show destroy]
    resources :employees
    resources :company_values
    resources :rewards
  end

  root to: 'pages#home'
  resources :kudos
  resources :rewards, only: %i[index show]
  resources :orders, only: %i[index create]
  get '/pages' => 'pages#home'
  get '/pages/home' => 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
