Rails.application.routes.draw do
  # topページとテストのルーティング
  root 'static_pages#top'
  get 'test', to: 'static_pages#test'

  # 診断関係のルーティング
  get 'diagnoses/new'
  post 'diagnoses/index'
  
  # ログイン関連のルーティング
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  # 会員登録のルーティング
  resources :users, only: [:new, :create]

  # Dog関連のルーティング
  resources :dogs, only: [:show, :index]
end
