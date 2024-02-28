Rails.application.routes.draw do
  # topページとテストのルーティング
  root 'static_pages#top'
  # get 'test', to: 'static_pages#test'
  # get 'merge', to: 'static_pages#top_merge'
  get 'terms', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  # 診断関係のルーティング
  get 'diagnoses/new'
  post 'diagnoses/index'
  
  # ログイン関連のルーティング
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'

  # 会員登録のルーティング
  resources :users, only: [:new, :create]

  #投稿関係のルーティング
  resources :boards do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get 'bookmarks'
    end
  end

  # お気に入り投稿のルーティング
  resources :bookmarks, only: %i[create destroy]

  # Dog関連のルーティング
  resources :dogs, only: [:show, :index]
end
