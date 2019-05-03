Rails.application.routes.draw do
  devise_for :users

  root 'durians#index'

  # Routes for Durian
  # Index page (Durian)
  get '/durians' => 'durians#index', as: 'durians'

  # Create (C)
  get '/durians/new' => 'durians#new', as: 'new_durian'
  post '/durians' => 'durians#create'

  # Read (R)
  get '/durians/:id' => 'durians#show' , as: 'durian'

  # Update (U)
  get '/durians/:id/edit' => 'durians#edit', as: 'edit_durian'
  patch '/durians/:id' => 'durians#update'


  # Routes for Order
  # Index page (Order)
  get '/orders' => 'orders#index', as: 'orders'

  get '/orders/notification' => 'orders#notification', as: 'orders_notification'

  # Create (C)
  post '/orders' => 'orders#create'

  # Read (R)
  get '/orders/:id' => 'orders#show' , as: 'order'

end