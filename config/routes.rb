# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :employees, path: 'employees'

  authenticated :admin do
    root to: 'admin#dashboard', as: :admin_root
  end

  root to: 'pages#home'
  resources :kudos
  get '/pages' => 'pages#home'
  get '/pages/home' => 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
