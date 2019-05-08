class ShoppingcartsController < ApplicationController

def index
    puts session["cart"].inspect
    puts session["cart"].length

    @shopping_cart_items = session["cart"]
    puts @shopping_cart_items
  end

  def show
  end

  def new
  end

  def create
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

  def update
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
    if !session["cart"].kind_of?(Array)
    session["cart"] = []
    end


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

  redirect_to durian_path
  end

private
  def post_params
    params.require(:durian).permit(:id, :name, :price_per_kg, :weight)
  end

end