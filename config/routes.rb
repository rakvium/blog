Rails.application.routes.draw do
  root 'welcome#index'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users

  resources :posts do
    resources :comments
  end

  mount API => '/'
end
