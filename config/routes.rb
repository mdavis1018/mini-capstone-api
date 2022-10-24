Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  post "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"
  get "/supplier" => "supplier#index"
  get "/supplier/:id" => "supplier#show"

  ### users
  post "/users" => "users#create"

  ### sessions
  post "/sessions" => "sessions#create"

  post "/orders" => "orders#create"

  get "/orders" => "orders#index"

  get "/orders/:id" => "orders#show"

  ### carted_products
  post "/cartedproducts" => "carted_products#create"
  get "/cartedproducts" => "carted_products#index"
  delete "/carted_products/:id" => "carted_products#destroy"
end
