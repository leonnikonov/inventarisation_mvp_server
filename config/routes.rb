Rails.application.routes.draw do
  resources :server_corpus do
    member do
      get :bind_part
    end
  end
  resources :servers
  resources :server_parts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
