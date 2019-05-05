require 'json'
require 'stripe'
require 'net/http'
require 'twilio-ruby'

class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
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

    render plain: "Sent!"
  end

 def postal_code
    url = 'https://developers.onemap.sg/commonapi/search?searchVal=763335&returnGeom=N&getAddrDetails=Y'
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
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: 'MSW',
        description: '10kg MSW Durian',
        images: ['https://example.com/t-shirt.png'],
        amount: 2000,
        currency: 'sgd',
        quantity: 1,
      }],
      success_url: 'http://localhost:3000',
      cancel_url: 'http://localhost:3000',
    )

    render plain: session.id
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def post_params
    params.require(:order).permit(:name)
  end

end