require 'json'
require 'stripe'
require 'net/http'
require 'twilio-ruby'

class OrdersController < ApplicationController
  auth_token = ENV['TWILIO_API_KEY']
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

  skip_before_action :verify_authenticity_token, :only => [:payment_webhook]

  def send_sms_invoice ()
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: ENV['TWILIO_SENDER_PHONE_NUMBER'],
      to: '+6594242851',
      body: "Hello World!"
    )

  end

  def payment
    url = URI.parse("https://checkout.stripe.com/pay")
    req = Net::HTTP.new(url.host, url.port)
    req.use_ssl = true if url.scheme == 'https'
    res = req.request_head(url.path)

    if shopping_cart_valid? == true && res.code == "200"
      payment_name = ""
      payment_amount = 0
      txn_id = SecureRandom.uuid

      # create delivery record in database
      @delivery = Delivery.new(name: session["delivery_details"]["name"],
                           email: session["delivery_details"]["email"],
                           contact_number: session["delivery_details"]["contact_number"],
                           delivery_comment: session["delivery_details"]["comment"],
                           delivery_address: session["delivery_details"]["address"],
                           postal_code: session["delivery_details"]["postal_code"],
                           unit_number: session["delivery_details"]["unit_number"],
                           delivery_date: session["delivery_details"]["date"],
                           delivery_time: session["delivery_details"]["time"])
      @delivery.save

      # create order record in database with created status
      session["cart"].each do |item|
        @durian = Durian.find(item["id"])

        payment_name += @durian.name + ", "
        payment_amount += item["price_per_kg"].to_i * item["weight"].to_i

        @order = Order.new(weight_in_kg: item["weight"],
                           payment_amount: item["price_per_kg"].to_i * item["weight"].to_i,
                           txn_date: DateTime.current(),
                           txn_id: txn_id,
                           order_status: "created",
                           delivery: @delivery,
                           durian: @durian)

         @order.save
      end

      # create stripe checkout session
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: "Payment for #{ payment_name.chomp(",") } Durian",
          description: "Order ID: #{ txn_id }",
          images: ['http://c40dc27b.ngrok.io/assets/durian-payment.jpg'],
          amount: payment_amount,
          currency: 'sgd',
          quantity: 1
        }],
        success_url: "http://localhost:3000/orders/payment/success/#{ txn_id }",
        cancel_url: "http://localhost:3000"
      )

      render plain: session.id

    else
      render plain: "something is wrong with the shopping cart"
    end
  end

  def payment_success
    @order_id = params[:id]
    session["cart"] = []
  end

  def payment_webhook
    event_json = JSON.parse(request.body.read)

    txn_id = event_json["data"]["object"]["display_items"][0]["custom"]["description"].split(": ")[1]
    charge_id = event_json["data"]["object"]["payment_intent"]

    @orders = Order.where(txn_id: txn_id)

    @orders.each do |order|
       order.update(order_status: 'paid', charge_id: event_json["data"]["object"]["payment_intent"])
    end

    # call send invoice method pass, in the @orders for processing

    render plain: "webhook"
  end
end