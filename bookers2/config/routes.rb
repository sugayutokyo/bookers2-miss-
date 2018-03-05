Rails.application.routes.draw do
  devise_for :users
  get '/books/total' => 'books#total', as: 'books_total'
  get '/books/welcome' => 'books#welcome', as: 'books_welcome'
  
  resources :books
  resources :users, only: [:show, :edit, :update, :index]

  root 'books#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
