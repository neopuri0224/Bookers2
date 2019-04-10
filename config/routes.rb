Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:show, :new, :index, :edit, :update]
  get 'about' => 'books#about'

end