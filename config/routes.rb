Rails.application.routes.draw do

  root 'static_pages#top'
  
  # 診断関係のルーティング
  get 'diagnoses/new'
  post 'diagnoses/index'
  

  get 'test', to: 'static_pages#test'

  # ログイン関連のルーティング
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  # 会員登録のルーティング
  resources :users, only: [:new, :create]
end
