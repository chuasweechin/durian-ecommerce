class ShoppingcartsController < ApplicationController

skip_before_action :verify_authenticity_token

  def index
    @payment_amount = 0

    session["cart"].each do |item|
      @payment_amount += item["price_per_kg"].to_i * item["weight"].to_i
    end
  end

  def checkout
    if shopping_cart_valid? == false
      redirect_to root_path
    end
  end


  def set_delivery_details
     session["delivery_details"] = delivery_params
     redirect_to confirmation_path
  end

  def confirmation
    if shopping_cart_valid? == false
      redirect_to root_path
    end

    @payment_amount = 0

    session["cart"].each do |item|
      @payment_amount += item["price_per_kg"].to_i * item["weight"].to_i
    end

  end

  def plus_weight
    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        durian["weight"] = durian["weight"].to_i + 1
        durian["weight"] = durian['weight'].to_s

        redirect_to shoppingcarts_path
      end
    end
  end

  def minus_weight
    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        durian["weight"] = durian["weight"].to_i - 1
        durian["weight"] = durian['weight'].to_s

        redirect_to shoppingcarts_path
      end
    end
  end

  def delete_item
    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        session["cart"].delete_if { |hash| hash["id"] == post_params["id"] }
        redirect_to shoppingcarts_path
      end
    end
  end

  def add_item
    found = false;

    # converting request.body which is in string (ajax.js) to JSON object
    current_order = JSON.parse(request.body.read)

    if session["cart"].length == 0
      session["cart"] << current_order
      found = true
      render :json => session["cart"]
    else
      session["cart"].each do |durian|
        if durian["id"] == current_order["id"]
          durian['weight'] = durian['weight'].to_i + current_order["weight"].to_i
          durian['weight'] = durian['weight'].to_s
          found = true
        end
      end

      if found == false
        session["cart"] << current_order
      end

      # redirect_to root_path
      render :json => session["cart"]
    end

end


private
  def post_params
    params.require(:durian).permit(:id, :name, :price_per_kg, :weight, :image_url)
  end

  def delivery_params
    params.require(:delivery).permit(:name, :email, :contact_number, :comment, :postal_code, :unit_number, :address, :date, :time)
  end

end