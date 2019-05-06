class DuriansController < ApplicationController

  def index
    puts "HERE LA!"
    puts session["cart"].inspect
    @durians = Durian.all
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
  puts "HEY LOOK HERE!"
  puts post_params

  session["cart"] << post_params
  redirect_to durians_path
  end

private
  def post_params
    params.require(:durian).permit(:name, :price_per_kg, :weight)
  end

end