class DuriansController < ApplicationController

  def index
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

private
  def post_params
    params.require(:durian).permit(:name, :price_per_kg)
  end

end