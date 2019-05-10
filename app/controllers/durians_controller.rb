class DuriansController < ApplicationController
  def index
    @durians = Durian.all

    if (session["cart"] == nil)
      session["cart"] = []
    end

    if (session["delivery_details"] == nil)
      session["delivery_details"] = {}
    end

  end
end