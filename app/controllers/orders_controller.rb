require 'json'
require 'stripe'
require 'net/http'
require 'twilio-ruby'

class OrdersController < ApplicationController
  auth_token = ENV['TWILIO_API_KEY']
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  Stripe.api_key = ENV['STRIPE_SECRET_KEY']

  skip_before_action :verify_authenticity_token, :only => [:payment_webhook]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def notification
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: ENV['TWILIO_SENDER_PHONE_NUMBER'],
      to: '+6594242851',
      body: "Hello World!"
    )

    render plain: "SMS Sent!"
  end

  def payment
    payment_amount = 0

    txn_id = SecureRandom.uuid
    @user = User.find(current_user.id)

    # create payment order in the system if item has weight more than 0
    session["cart"].each do |item|
      if (item["weight"].to_i > 0)
          @durian = Durian.find(item["id"])

          @order = Order.new(weight_in_kg: item["weight"],
                             payment_amount: item["price_per_kg"].to_i * item["weight"].to_i,
                             txn_date: DateTime.current(),
                             txn_id: txn_id,
                             delivery_address: request.query_parameters[:address],
                             order_status: "created",
                             user: @user,
                             durian: @durian)

          @order.save
          payment_amount += item["price_per_kg"].to_i * item["weight"].to_i
      end
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Payment for Durian',
        description: "Order ID: #{ txn_id }",
        images: ['http://c40dc27b.ngrok.io/assets/durian-payment.jpg'],
        amount: payment_amount,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: "http://localhost:3000/orders/#{ txn_id }",
      cancel_url: "http://localhost:3000"
    )

    render plain: session.id
  end

  def payment_webhook
    event_json = JSON.parse(request.body.read)

    txn_id = event_json["data"]["object"]["display_items"][0]["custom"]["description"].split(": ")[1]
    charge_id = event_json["data"]["object"]["payment_intent"]

    @orders = Order.where(txn_id: txn_id)

    @orders.each do |order|
       order.update(order_status: 'paid', charge_id: event_json["data"]["object"]["payment_intent"])
    end

    render plain: "webhook"
  end
end