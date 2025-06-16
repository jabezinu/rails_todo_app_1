Rails.application.routes.draw do
  root 'tasks#index'  # When someone visits your app, show all tasks
  resources :tasks    # This creates all the routes we need automatically!
end