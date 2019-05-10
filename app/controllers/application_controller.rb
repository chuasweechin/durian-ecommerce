class ApplicationController < ActionController::Base
  def shopping_cart_valid?
    if session["cart"].length === 0
      return false
    else
      session["cart"].each do |item|
        if item["weight"].to_i < 1
          return false
        end
      end
    end

    return true
  end
end