Rails.application.routes.draw do
  devise_for :users

  root 'durians#index'

  # Routes for Durian
  # Index page (Durian)
  get '/durians' => 'durians#index', as: 'durians'

  # # Create (C)
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
  get '/orders/:id' => 'orders#show' , as: 'order'

  get '/orders/payment' => 'orders#payment', as: 'payment'
  post '/orders/payment/webhook' => 'orders#payment_webhook'

  get '/orders/notification' => 'orders#notification', as: 'orders_notification'
  get '/orders/postal' => 'orders#postal_code', as: 'orders_postal_code'




  # # Shopping Cart page
  # Routes for Shopping Cart
  # Index page (Shopping Cart)
  get '/shoppingcarts' => 'shoppingcarts#index', as: 'shoppingcarts'

  # Edit item in cart (U)
  # post '/shoppingcarts/edit' => 'shoppingcarts#edit_item', as: 'shoppingcarts_edit'

  post '/shoppingcarts/plus' => 'shoppingcarts#plus_weight', as: 'shoppingcarts_plus'

  post '/shoppingcarts/minus' => 'shoppingcarts#minus_weight', as: 'shoppingcarts_minus'

  # Delete item in cart (D)
  post '/shoppingcarts/delete' => 'shoppingcarts#delete_item', as: 'shoppingcarts_delete'

  # Cookies Handlers
  post '/shoppingcarts/:id/cart' => 'shoppingcarts#add_item', as: 'shoppingcarts_add'

end