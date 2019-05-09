class ShoppingcartsController < ApplicationController
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

    if session["cart"].length == 0
      session["cart"] << post_params
      found = true
    else
      session["cart"].each do |durian|
        if durian["id"] == post_params["id"]
          durian['weight'] = durian['weight'].to_i + post_params["weight"].to_i
          durian['weight'] = durian['weight'].to_s
          found = true
        end
      end
    end

    if found == false
      session["cart"] << post_params
    end

    redirect_to root_path
  end

private
  def post_params
    params.require(:durian).permit(:id, :name, :price_per_kg, :weight, :image_url)
  end

  def delivery_params
    params.require(:delivery).permit(:name, :email, :contact_number, :comment, :postal_code, :unit_number, :address, :date, :time)
  end

end