class DuriansController < ApplicationController
  def index
    @durains = Durian.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def post_params
    params.require(:durian).permit(:name)
  end

end