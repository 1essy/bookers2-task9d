Rails.application.routes.draw do
  devise_for :users
  get "search" => "searches#search"
  get "search_book" => "books#search_book"
  resources :users, :only => [:index,:show,:edit,:update] do
    get "search", to: "users#search"
  end
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  
  resources :groups, except: [:destroy]
  resources :groups do     
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to =>"homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end