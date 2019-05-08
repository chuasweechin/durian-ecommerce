class DuriansController < ApplicationController

  def index
    # puts "HERE LA!"
    # puts session["cart"].inspect
    # puts session["cart"].length
    @durians = Durian.all
    # session["cart"] = []
    # puts session["cart"]
  end

  def show
    @durian = Durian.find(params[:id])
  end

  def new
  end

  def create
    @durian = Durian.new(post_params)
    @durian.save

    redirect_to @durian
  end

  def edit
    @durian = Durian.find(params[:id])
  end

  def update
    @durian = Durian.find(params[:id])

    @durian.update(post_params)
    redirect_to @durian
  end

  def destroy
  end

  def set_cookies
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
      if durian["name"] == post_params["name"]
        durian['weight'] = durian['weight'].to_i + post_params["weight"].to_i
        durian['weight'] = durian['weight'].to_s
        found = true
      end
    end
  end

  if found == false
    session["cart"] << post_params
  end


byebug
  redirect_to durian_path
  end

private
  def post_params
    params.require(:durian).permit(:name, :price_per_kg, :weight)
  end

end