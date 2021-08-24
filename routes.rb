Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  get 'books/index' => 'books#index'
  get 'books/new' => 'books#new'
  root 'books#index'
end
