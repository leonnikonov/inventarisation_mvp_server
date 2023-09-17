Rails.application.routes.draw do
  resources :server_corpus
  resources :servers
  resources :server_parts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
