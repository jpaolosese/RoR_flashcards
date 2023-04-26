Rails.application.routes.draw do
  get 'decks/index'
  get 'decks/show'
  get 'decks/new'
  get 'decks/create'
  get 'decks/edit'
  get 'decks/update'
  get 'decks/destroy'
  get 'sessions/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
