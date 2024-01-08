Rails.application.routes.draw do
  root 'static_pages#top'

  get 'test', to: 'static_pages#test'
end
