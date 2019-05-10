class ShoppingcartsController < ApplicationController
skip_before_action :verify_authenticity_token
def index
    puts session["cart"].inspect
    puts session["cart"].length

    @shopping_cart_items = session["cart"]
    puts @shopping_cart_items

    @shopping_cart_items = session["cart"]

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

  def edit_item
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
    # converting request.body which is in string (ajax.js) to JSON object
    current_order = JSON.parse(request.body.read)
    if !session["cart"].kind_of?(Array)
      session["cart"] = []
    end


  found = false;
  if session["cart"].length == 0
    session["cart"] << current_order
    found = true
  else
    session["cart"].each do |durian|
      if durian["id"] == current_order["id"]
        durian['weight'] = durian['weight'].to_i + current_order["weight"].to_i
        durian['weight'] = durian['weight'].to_s
        found = true
      end
    end
  end

  if found == false
    session["cart"] << current_order
  end
  p 'cart'
  p session["cart"]
  # redirect_to root_path
  render :json => session["cart"]
  end

private
  def post_params
    params.require(:durian).permit(:id, :name, :price_per_kg, :weight)
  end

end