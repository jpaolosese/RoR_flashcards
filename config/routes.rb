Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: proc { |env| [200, {}, [File.read("{Rails.root}/public/index.html")]] }

  get "/auth/login", to: "sessions#new"
  post "/auth/login", to: "sessions#create"
  delete "/auth/logout", to: "sessions#destroy"
end
