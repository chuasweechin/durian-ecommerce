Rails.application.routes.draw do
  root 'durians#index'

  # Routes for Durian
  get '/durians' => 'durians#index', as: 'durians'

  # Routes for Order
  get '/orders/payment' => 'orders#payment', as: 'payment'
  post '/orders/payment/webhook' => 'orders#payment_webhook'

  # Routes for Shopping Cart
  get '/shoppingcarts' => 'shoppingcarts#index', as: 'shoppingcarts'
  get '/shoppingcarts/checkout' => 'shoppingcarts#checkout'
  get '/shoppingcarts/confirmation' => 'shoppingcarts#confirmation', as: 'confirmation'

  post '/shoppingcarts/delivery' => 'shoppingcarts#set_delivery_details', as: 'set_delivery_details'

  post '/shoppingcarts/cart' => 'shoppingcarts#add_item', as: 'shoppingcarts_add'
  post '/shoppingcarts/plus' => 'shoppingcarts#plus_weight', as: 'shoppingcarts_plus'
  post '/shoppingcarts/minus' => 'shoppingcarts#minus_weight', as: 'shoppingcarts_minus'
  post '/shoppingcarts/delete' => 'shoppingcarts#delete_item', as: 'shoppingcarts_delete'

end