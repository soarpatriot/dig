Rails.application.routes.draw do

  get 'short' => 'home#short'
  get 'normal' => 'home#normal'
  get 'medium' => 'home#medium'
  get 'long' => 'home#long'
  # writer your routes here

  #mount ActionCable.server => '/cable'
  root to: 'visitors#index'
end
