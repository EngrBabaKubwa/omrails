Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get "sign_in" => 'devise/sessions#new'
    delete "sign_out" => 'devise/sessions#destroy'
    get 'sign_up' => 'devise/registrations#new'
  end
  
  get 'feed', to: 'feed#show'
  
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end

  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end

  resources :items
  resources :observations
  resources :tweets
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  root 'pages#home'
  # above line is shortcut for: get '/' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
