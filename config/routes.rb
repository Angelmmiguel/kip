Rails.application.routes.draw do
  # List articles
  root 'articles#index'

  # Articles routes
  # See: http://jeromedalbert.com/how-dhh-organizes-his-rails-controllers/
  namespace :articles do
    resources :search, only: [:index]
  end
  resources :articles

  # Help routes
  namespace :help do
    resources :markdown, only: [:index]
  end
end
