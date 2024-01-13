Rails.application.routes.draw do
  root 'static_pages#top'

  get 'test', to: 'static_pages#test'

  # ログイン関連のルーティング
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  # 会員登録のルーティング
  resources :users, only: [:new, :create]
end
