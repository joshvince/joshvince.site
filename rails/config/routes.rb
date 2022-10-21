# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'info#me'
  get '/contact', to: 'info#contact'
  get '/projects', to: 'info#project_list'
  get 'blog', to: 'blog#index'
end
