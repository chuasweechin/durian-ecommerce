class DuriansController < ApplicationController

  def index
    @durians = Durian.all

    if (session["cart"] == nil)
      session["cart"] = []
    end
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
end