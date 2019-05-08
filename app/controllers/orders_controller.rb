require 'json'
require 'stripe'
require 'net/http'
require 'twilio-ruby'

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:payment_webhook]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def notification
    auth_token = ENV['TWILIO_API_KEY']
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: ENV['TWILIO_SENDER_PHONE_NUMBER'],
      to: '+6594242851',
      body: "Hello World!"
    )

    render plain: "SMS Sent!"
  end

  def postal_code
    url = 'https://developers.onemap.sg/commonapi/search?searchVal=510578&returnGeom=N&getAddrDetails=Y'
    uri = URI(url)
    response = Net::HTTP.get(uri)

    response_in_JSON = JSON.parse(response)

    if (response_in_JSON["results"].length == 0 )
      render plain: "not found!"
    else
      render plain: response_in_JSON["results"][0]["ADDRESS"]
    end
  end

  def payment
    payment_amount = 0

    session["cart"].each do |item|
      payment_amount += item["price_per_kg"].to_i * item["weight"].to_i
    end

    puts payment_amount

    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'Payment for Durian',
        description: 'Order ID: ',
        images: ['http://c40dc27b.ngrok.io/assets/durian-payment.jpg'],
        amount: payment_amount,
        currency: 'sgd',
        quantity: 1
      }],
      success_url: 'http://localhost:3000',
      cancel_url: 'http://localhost:3000',
    )

    render plain: session.id
  end


  def new
    @shopping_cart_items = session["cart"]

    @payment_amount = 0

    session["cart"].each do |item|
      @payment_amount += item["price_per_kg"].to_i * item["weight"].to_i
    end
  end

  def payment_webhook
    event_json = JSON.parse(request.body.read)

    # Do something with event_json
    p event_json["data"]["object"]["payment_intent"]

    # Return a response to acknowledge receipt of the event
    render plain: "test webhook"
  end

  def create
  end

  def edit
  end

  def update
  end

  # def destroy
  # end

# private
#   def post_params
#     params.require(:order).permit(:name)
#   end

end