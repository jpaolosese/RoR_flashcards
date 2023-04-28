Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: proc { |env| [200, {}, [File.read("{Rails.root}/public/index.html")]] }

  # Log in
  get "/auth/login", to: "sessions#new"
  post "/auth/login", to: "sessions#create"

  # Log out
  delete "/auth/logout", to: "sessions#destroy"
  
  # USER ROUTES
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  #
  # # DECKS ROUTES
  # # Get all decks of a particular user
  # get "/decks", to: "decks#index"
  #
  # # Get a particular deck
  # get "/decks/:id", to: "decks#show"
  #
  # # Create a new deck
  # get "/decks/new", to: "decks#new"
  # post "/decks", to: "decks#create"
  #
  # # Edit a deck
  # get "/decks/:id/edit", to: "decks#edit"
  # patch "/decks/:id", to: "decks#update"
  #
  #
  #
  #
  # # CARDS ROUTES
  # # Show all cards in a deck
  # get "/decks/:id/cards", to: "cards#index"
  #
  # # Show a particular card
  # get "/decks/:id/cards/:id", to: "cards#show"
  #
  # # Create a new card
  # get "/decks/:id/cards/new", to: "cards#new"
  # post "/decks/:id/cards", to: "cards#create"
  #
  # # Edit a card
  # get "/decks/:id/cards/:id/edit", to: "cards#edit"
  # patch "/decks/:id/cards/:id", to: "cards#update"
  #
  # # Delete a card
  # delete "/decks/:id/cards/:id", to: "cards#destroy"

  resources :users, except: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :decks, except: [:destroy] do
      resources :cards
    end
  end
end
