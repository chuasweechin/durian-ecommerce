require 'json'
require 'stripe'
require 'HTTParty'
require 'nokogiri'
require 'net/http'
require 'twilio-ruby'

class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:payment_webhook]

  def send_invoice (orders)
    # prepare content for sms
    sms_order_detail = ""
    email_address = orders[0].delivery["email"]
    send_to = "+65" + orders[0].delivery["contact_number"]

    total_bill_for_display = 0

    order_id_for_display = orders[0]["txn_id"]
    address_for_display = orders[0].delivery["delivery_address"]
    dtime_for_display = orders[0].delivery["delivery_time"]
    ddate_for_display = format_date_for_display(orders[0].delivery["delivery_date"])

    orders.each do |order|
      sms_order_detail += "- #{ order["weight_in_kg"].to_i } kg of #{ order.durian.name } \n"
      total_bill_for_display += order["payment_amount"].to_i/100
    end

    sms_title = "Order ID: #{ order_id_for_display } \n\nWe have received your payment of $#{ total_bill_for_display } for:"
    sms_delivery = "Your order will be delivered to #{ address_for_display } on #{ ddate_for_display } from #{ dtime_for_display }"
    sms_footer = "\nPlease call us at 6123 4567 if you need further details"

    # twilio api method
    auth_token = ENV['TWILIO_API_KEY']
    account_sid = ENV['TWILIO_ACCOUNT_SID']

    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: ENV['TWILIO_SENDER_PHONE_NUMBER'],
      to: send_to,
      body: sms_title + "\n" + sms_order_detail + "\n" + sms_delivery + "\n" + sms_footer
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
      Stripe.api_key = ENV['STRIPE_SECRET_KEY']

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: "Payment for #{ payment_name.chomp(", ") } Durian",
          description: "Order ID: #{ txn_id }",
          images: ['https://i.imgur.com/upyLrhW.jpg'],
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

    send_invoice(@orders)

    render plain: "success"
  end

end