require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do

  resources :visitors do 
    collection do 
      delete 'all'
    end
  end
  devise_for :users
  resources :users
  # writer your routes here

  mount Sidekiq::Web => '/sidekiq'
  mount StatusPage::Engine => '/'
  #mount ActionCable.server => '/cable'
  root to: 'visitors#index'
end
