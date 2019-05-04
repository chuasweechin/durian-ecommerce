require 'json'
require 'net/http'
require 'twilio-ruby'

class OrdersController < ApplicationController
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

  def create
  end

  # def edit
  # end

  def update
  end

  # def destroy
  # end

# private
#   def post_params
#     params.require(:order).permit(:name)
#   end

end