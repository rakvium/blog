# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'welcome#index'

    get 'static_pages/home'
    get 'static_pages/help'
    get 'static_pages/about'
    get 'static_pages/contact'

    devise_for :users

    resources :posts do
      resources :comments, only: %i[create destroy]
    end
  end

  mount API::Base, at: '/'
  mount GrapeSwaggerRails::Engine, at: 'swagger'
end
