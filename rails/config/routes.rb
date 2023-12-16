# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'info#me'
  get '/contact', to: 'info#contact'
  get '/blog/:slug', to: 'blog#show'
  get '/blog', to: 'blog#index'
  get '/projects', to: 'projects#index', as: 'projects'
  get '/projects/:slug', to: 'projects#show', as: 'project'
  get '/jobs', to: 'projects#jobs', as: 'jobs'
  get '/side-projects', to: 'projects#side_projects', as: 'side_projects'

  mount ActiveAnalytics::Engine, at: "analytics"
end
