# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'info#home'
  get '/about', to: 'info#me', as: 'about'
  get '/contact', to: 'info#contact'
  get '/writing/:id', to: 'writing#blog_post', as: 'writing'
  get '/writing', to: 'writing#index', as: 'writing_index'
  get '/rss_feed', to: 'writing#index', defaults: { format: :rss }
  get '/blog/:id', to: 'writing#blog_post'
  get '/blog', to: redirect('/writing')
  get '/the-bit', to: 'writing#the_bit', as: 'the_bit'
  get '/projects', to: 'projects#index', as: 'projects'
  get '/projects/:slug', to: 'projects#show', as: 'project'
  get '/jobs', to: 'projects#jobs', as: 'jobs'
  get '/side-projects', to: 'projects#side_projects', as: 'side_projects'

  mount ActiveAnalytics::Engine, at: "analytics"
end
