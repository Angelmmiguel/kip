Rails.application.routes.draw do
  # List articles
  root 'articles#index'
  
  resources :articles
end
