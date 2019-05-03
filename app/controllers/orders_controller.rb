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