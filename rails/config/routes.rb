# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'info#me'
  get '/contact', to: 'info#contact'
  get '/blog/:slug', to: 'blog#show'
  get '/blog', to: 'blog#index'
  resources :projects, only: [:index, :show]
end
