class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end



  def create
  end

  # def edit
  # end

  def update
  end

  # def destroy
  # end

# private
#   def post_params
#     params.require(:order).permit(:name)
#   end

end