Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "motivations#index"
  resources :motivations do
   resources :comments, only: :create
   resource :favorites, only: [:create, :destroy]
  collection do
    get 'search' #motivationsに基づく検索、コメント機能のためネストする
  end
end
end