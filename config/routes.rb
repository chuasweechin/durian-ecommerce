Rails.application.routes.draw do
  devise_for :users

  root 'durians#index'

  # Routes for Durian
  get '/durians' => 'durians#index', as: 'durians'


  # Routes for Order
  get '/orders' => 'orders#index', as: 'orders'
  get '/orders/payment' => 'orders#payment', as: 'payment'

  post '/orders/payment/webhook' => 'orders#payment_webhook'

  get '/orders/notification' => 'orders#notification', as: 'orders_notification'
  get '/orders/:id' => 'orders#show' , as: 'order'

  # Routes for Shopping Cart
  get '/shoppingcarts' => 'shoppingcarts#index', as: 'shoppingcarts'

  # Edit item in cart (U)
  # post '/shoppingcarts/edit' => 'shoppingcarts#edit_item', as: 'shoppingcarts_edit'

  post '/shoppingcarts/plus' => 'shoppingcarts#plus_weight', as: 'shoppingcarts_plus'

  post '/shoppingcarts/minus' => 'shoppingcarts#minus_weight', as: 'shoppingcarts_minus'

  # Delete item in cart (D)
  post '/shoppingcarts/delete' => 'shoppingcarts#delete_item', as: 'shoppingcarts_delete'

  # Cookies Handlers
  post '/shoppingcarts/cart' => 'shoppingcarts#add_item', as: 'shoppingcarts_add'
end