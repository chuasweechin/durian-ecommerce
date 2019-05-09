class DuriansController < ApplicationController
  def index
    @durians = Durian.all

    if (session["cart"] == nil)
      session["cart"] = []
    end
  end
end