Rails.application.routes.draw do
  root 'pages#home'
  # above line is shortcut for: get '/' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact-us' => 'pages#contact-us'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
