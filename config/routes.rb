Rails.application.routes.draw do
  get 'users/mypage'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  get '/books/welcome' => 'books#welcome', as: 'books_welcome'
  get '/books/about' => 'books#about', as: 'books_about'
  get '/users/:id' => 'users#view', as: 'user_view'

  resources :users, only: [:edit, :update, :index]
  resources :books

  root to: 'books#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
