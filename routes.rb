Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  get 'hello/index' => 'hello#index'

  resources :books do
    resources :likes, only: [:create, :destroy]

root 'hello#index'

end

root 'lectures#index'
get 'lectures/index'  => 'lectures#index'
get 'lectures/new'  => 'lectures#new'
post 'lectures/new'  => 'lectures#create'

end
