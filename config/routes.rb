Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions, only: [:index, :show, :create, :destroy] do
    resources :answers, only: [:create, :destroy] do
      member do
        post :upvote
        post :downvote
      end
    end
    member do
      post :favorite
      post :unfavorite
      post :upvote
      post :downvote
    end
  end
  resources :users
  resources :favorites, :only => :index
  root "questions#index"
  namespace :admin do
    root "questions#index"
  end
end
