class CartsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @cart = Cart.find(params[:id]) unless @cart.id == params[:id]
  end
end
