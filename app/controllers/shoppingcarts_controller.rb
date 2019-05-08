class ShoppingcartsController < ApplicationController

def index
    puts "HERE LA!"
    puts session["cart"].inspect
    puts session["cart"].length

    @shopping_cart_items = session["cart"]
    puts "HERE HERE"
    puts @shopping_cart_items
  end

  def show
    # @durian = Durian.find(params[:id])
  end

  def new
  end

  def create
    # @durian = Durian.new(post_params)
    # @durian.save

    # redirect_to @durian
  end

  def edit_item
    puts "EDITED ITEM"
    puts post_params
  end

  def update
  end

  def delete_item
    puts "DELETED ITEM"
    puts post_params

    session["cart"].each do |durian|
      if durian["id"] == post_params["id"]
        session["cart"].delete_if { |hash| hash["id"] == post_params["id"] }
        # byebug
        redirect_to shoppingcarts_path
      end
    end
  end

  def add_item
    if !session["cart"].kind_of?(Array)
    session["cart"] = []
    end


  found = false;
  puts "HEY LOOK HERE!"
  puts post_params

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


# byebug
  redirect_to durian_path
  end

private
  def post_params
    params.require(:durian).permit(:id, :name, :price_per_kg, :weight)
  end

end